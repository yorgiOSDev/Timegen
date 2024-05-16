import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_template/services/location_service.dart';
import 'package:flutter_template/widgets/app_bar_dashboard_widget.dart';
import 'package:flutter_template/widgets/attendance.dart';
import 'package:flutter_template/services/app_service.dart';
import 'package:flutter_template/widgets/custom_bottom_sheet.dart';
import 'package:future_progress_dialog/future_progress_dialog.dart';
import 'package:http/http.dart' as http;
import 'package:multi_dropdown/models/value_item.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';

import '../router/route_utils.dart';
import '../utils/alert/alert.dart';
import '../utils/alert/awesome_snack_bar_utils.dart';
import '../utils/constants.dart';
import '../utils/responsive/responsive_layout.dart';
import '../widgets/drawer_widget.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appService = context.watch<AppService>();
    return Scaffold(
        appBar: AppBarDashboardWidget(title: SCREENS.dashboard.toTitle),
        drawer: !ResponsiveLayout.isDesktop(context) ? const DrawerWidget() : null,
        body: Column(
          children: [
            SingleChildScrollView(
              padding: EdgeInsets.all(10),
              child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      _clock(),
                      SizedBox(height: 16),
                      Container(
                          height: 372,
                          padding: EdgeInsets.all(0),
                          child: FutureBuilder(
                              future: loadAttendance(context),
                              builder: (context, AsyncSnapshot snapshot) {
                                if (snapshot.hasData) {
                                  return snapshot.data;
                                } else {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                              })),
                    ]),
              ),
            ),
          ],
        ));
  }
}

_clock() {
  return Card(
      child: Column(
    children: [
      SizedBox(height: 10),
      DigitalClock(
        hourMinuteDigitTextStyle: const TextStyle(fontSize: 80),
        colon: Text(':', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
        secondDigitTextStyle: const TextStyle(fontSize: 30),
        is24HourTimeFormat: false,
      ),
      SizedBox(height: 10),
    ],
  ));
}

Future loadAttendance(context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  final response = await http.get(Uri.parse('${Server.baseURL}/api/v1/attendance/current'),
      headers: <String, String>{'Authorization': prefs.getString('token') ?? ""});
  List<ValueItem> projects = [];

  if (response.statusCode == 200) {
    var attendance = jsonDecode(response.body);
    Map<String,dynamic> projectData = {
    'name':    attendance['data']['attributes']['project']['name'],
    'color':   attendance['data']['attributes']['project']['colour'],
    'location':attendance['data']['attributes']['start_location']?['address'] ?? "No location tracked",
  };
    prefs.setInt("attendance_id", int.parse(attendance["data"]["id"]));
    return AttendanceWidget(
      notes: attendance['data']['attributes']['description']?? "",
      projectData: projectData,
      state: attendance['data']['attributes']['state'],
      projects: projects,
      startedAt: attendance['data']['attributes']['started_at'] ?? 'No data',
      totalWorkingHours: attendance['data']['attributes']['total_working_hours'] ?? 0.0,
      totalBreakHours:
          (attendance['data']['attributes']['total_break_hours'] as num?)?.toDouble() ?? 0.0,
    );
  } else {
    final responseInfo = await http.get(Uri.parse('${Server.baseURL}/api/v1/user/info'),
        headers: <String, String>{'Authorization': prefs.getString('token') ?? ""});
    List<Map> p = [];
    if (responseInfo.statusCode == 200) {
      var info = jsonDecode(responseInfo.body);
      for (var data in info['included']) {
        if (data['type'] == "project") {
          p.add({
            "name": data['attributes']['name'],
            "id": data['attributes']['id'],
            "color": data['attributes']['colour']
          });
        }
      }
      return Card(
        child: Padding(
          padding: EdgeInsets.only(top: 20, bottom: 20),
          child: ListView.builder(
            padding: EdgeInsets.all(8),
            itemCount: p.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ListTile(
                      onTap: () {
                       showModalBottomSheet(
                         isScrollControlled: true,
                         enableDrag: false,
                         showDragHandle: true,
                         useRootNavigator: true,
                         shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
                         ),
                         context: context,
                         builder: (context) {
                           return CustomBottomSheet(
                             bottomSheetType: BottomSheetType.startWorking,
                             onPressed: () async {
                               await showDialog(
                                 context: context,
                                 builder: (context) => FutureProgressDialog(
                                   createAttendance(context, p[index]['id']),
                                   progress: const CircularProgressIndicator(),
                                   opacity: 0.7,
                                   decoration: BoxDecoration(
                                     color: Colors.transparent,
                                     borderRadius: BorderRadius.all(Radius.circular(4)),
                                   ),
                                 ),
                               );
                               Navigator.pop(context);
                             },
                           );
                         },
                       );
                                
                      },
                      title: Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 18,
                              height: 18,
                              decoration: BoxDecoration(
                                color: Color(
                                    int.parse("0xff" + p[index]['color'].toString().substring(1))),
                                borderRadius: BorderRadius.all(Radius.circular(2)),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(p[index]['name'],
                                    style: Theme.of(context).textTheme.titleMedium),
                              ],
                            ),
                          ],
                        ),
                        Icon(Icons.timer_outlined, size: 32.0),
                      ],
                    ),
                  )),
                  SizedBox(
                          height: 10,
                        ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 18),
                    child: Divider(
                      height: 1,
                      color: Color.fromRGBO(228, 231, 235, 1),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      );
    }
    return {'state': "new", 'projects': projects};
  }
}

Future createAttendance(BuildContext context, projectID) async {
  final position = Provider.of<LocationService>(context, listen: false).center;
  final address = Provider.of<LocationService>(context, listen: false).address;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final response = await http.post(
    Uri.parse('${Server.baseURL}/api/v1/attendance/new'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': prefs.getString('token') ?? ""
    },
    body: jsonEncode({"project_id": projectID,
    "location":{
      "longitude":position.longitude,
      "latitude": position.latitude,
      "address": address
      }
    }),
  );
  final message = jsonDecode(response.body);

  late SnackBar snackBar;
  if (response.statusCode == 200) {
    prefs.setInt("attendance_id", int.parse(jsonDecode(response.body)["data"]["id"]));
    Provider.of<AppService>(context, listen: false).attendanceState("working");
    snackBar = Alert.awesomeSnackBar(message: 'Sheet Started', type: AWESOMESNACKBARTYPE.success);
  } else {
    snackBar = Alert.awesomeSnackBar(message:message['message'], type: AWESOMESNACKBARTYPE.failure);
  }
  if (!context.mounted) return;
  ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(snackBar);
}
