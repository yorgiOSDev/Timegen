import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/utils/date_time_utils.dart';
import 'package:get/utils.dart';
import 'package:multi_dropdown/models/value_item.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/widgets/list_item.dart';
import '../router/route_utils.dart';
import '../utils/constants.dart';
import '../utils/responsive/responsive_layout.dart';
import '../widgets/app_bar_dashboard_widget.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/attendance.dart';
import '../widgets/drawer_widget.dart';
import 'package:http/http.dart' as http;

class AttendancesScreen extends StatelessWidget {
  const AttendancesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBarDashboardWidget(title: SCREENS.attendances.toTitle),
      drawer:
      !ResponsiveLayout.isDesktop(context) ? const DrawerWidget() : null,
      body: Column(children: [
        Expanded(
          child: FutureBuilder<Map>(
          future: loadAttendances(context),
          builder: (context, AsyncSnapshot<Map> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                padding: EdgeInsets.all(8),
                itemCount: snapshot.data?['data'].length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: ListTile(
                        title: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                          width: 20, height: 20,
                                          decoration: BoxDecoration(
                                              color:Color(int.parse("0xff" + snapshot.data!['data'][index]['attributes']['project']['colour'].toString().substring(1))),
                                              borderRadius: BorderRadius.all(Radius.circular(2))
                                          )),
                                      SizedBox(width: 10),
                                      Text(snapshot.data?['data'][index]['attributes']['project']['name'],
                                        style: Theme.of(context).textTheme.titleMedium,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,)
                                    ],
                                  ),
                                  Text('${snapshot.data?['data'][index]['attributes']['total_working_hours']} hours',
                                  style: Theme.of(context).textTheme.titleMedium,)
                                ]
                            ),
                            SizedBox(height: 10),
                            Divider(height: 1, color: Color.fromRGBO(228, 231, 235, 1)),
                            SizedBox(height: 16),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(Icons.timer_outlined, size: 22),
                                    SizedBox(width: 6),
                                    Text('Clock In: ${DateTimeUtils.formatToDateTime(snapshot.data?['data'][index]['attributes']['started_at'])}',
                                    style: Theme.of(context).textTheme.titleMedium,),
                                  ],
                                ),
                                SizedBox(height: 2,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(width: 30,),
                                    Flexible(
                                        child: Text(snapshot.data?['data'][index]['attributes']['start_location']?['address'] ?? 'No location tracked',
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: Theme.of(context).textTheme.bodyMedium)
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            SizedBox(height: 16),

                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(Icons.timer_off_outlined, size: 22),
                                    SizedBox(width: 6),
                                    Text('Clock Out: ${DateTimeUtils.formatToDateTime(snapshot.data?['data'][index]['attributes']['ended_at'])}',
                                    style: Theme.of(context).textTheme.titleMedium,),
                                  ],
                                ),
                                SizedBox(height: 2),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(width: 30,),
                                    Flexible(
                                        child: Text(snapshot.data?['data'][index]['attributes']['end_location']?['address'] ?? 'No location tracked',
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: Theme.of(context).textTheme.bodyMedium)
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  );
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
        })
        ),
      ]),
    );
  }

  Future<Map> loadAttendances(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final response = await http.get(
        Uri.parse('${Server.baseURL}/api/v1/attendance/list'),
        headers: <String, String>{
          'Authorization': prefs.getString('token') ?? ""
        });

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return new Map();
    }
  }

  _formatDateTime(dateTimeData) {

  }
}