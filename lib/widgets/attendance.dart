import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_template/services/location_service.dart';
import 'package:flutter_template/utils/DateFormatter/date_formatter.dart';
import 'package:flutter_template/widgets/custom_bottom_sheet.dart';
import 'package:future_progress_dialog/future_progress_dialog.dart';
import 'package:http/http.dart' as http;
import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/app_service.dart';
import '../utils/alert/alert.dart';
import '../utils/alert/awesome_snack_bar_utils.dart';
import '../utils/constants.dart';
import 'attendance_description_dialog.dart';

class AttendanceWidget extends StatelessWidget {
  AttendanceWidget({
    super.key, 
    required this.state, 
    required this.projects, 
    required this.startedAt, 
    required this.totalWorkingHours, 
    required this.totalBreakHours,
    required this.projectData,
    required this.notes
  });
  
  String state = "";
  List<ValueItem> projects = [];
  int projectIndex = 0;
  final MultiSelectController _controller = MultiSelectController();
  String startedAt = 'No Data';
  double totalWorkingHours = 0.0;
  double totalBreakHours = 0.0;
  Map<String,dynamic> projectData = {};
  String notes;
  

  @override
  Widget build(BuildContext context) {
    return _container(context);
  }

  _container(context) {
    return _component(state, context);
  }

  _component(state, context) {
    if (state == "working") {
      return _workingContainer(context, state);
    }
    if (state == "new") {
      return _createContainer(context, state);
    }

    if (state == "on break") {
      return _onBreakContainer(context, state);
    }
    return Text(state);
  }

  _workingContainer(context, state) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _projectName(context),
              Divider(color: Color.fromRGBO(228, 231, 235, 1)),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      _startedHour(context),
                      _attendanceStateText(state),
                    ],
                  ),

                  const SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _totalsHours(context),
                      // _workedHours(context),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 22),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                      child: _breakButton(context)
                  ),
                  SizedBox(width: 8,),
                  Expanded(
                      child: _completeButton(context)
                  ),
                ],
              ),

            ]),
      ),
    );
  }

  Row _projectName(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children:[
            Container(
              width: 18,
              height: 18,
              decoration:
              BoxDecoration(
                color:
                Color(
                    int.parse("0xff" + projectData['color'].toString().substring(1))),
                borderRadius: BorderRadius.all(Radius.circular(2)),
              ),
            ),
            SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                Text(projectData['name'], style: Theme.of(context).textTheme.titleMedium),
              ],
            ),
          ],
        ),
        _addNotesButton(context)
      ],
    );
  }

  _createContainer(context, state) {
    return Column(children: [
      const SizedBox(height: 24),
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            _startWorkButton(context),
            const SizedBox(height: 16),
            Container(
              width: 300,
              child: MultiSelectDropDown(
                selectedOptions: [projects.toList().first],
                onOptionSelected: (List<ValueItem> selectedOptions) {},
                options: projects.toList(),
                selectionType: SelectionType.single,
                optionTextStyle: const TextStyle(color: Colors.black),
                selectedOptionIcon: const Icon(Icons.check_circle),
                controller: _controller,
                dropdownHeight: 128,
              ),
            ),
          ],
        ),
      ),
    ]);
  }

  _onBreakContainer(context, state) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _projectName(context),
              Divider(color: Color.fromRGBO(228, 231, 235, 1)),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      _startedHour(context),
                      _attendanceStateText(state),
                    ],
                  ),

                  const SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _totalsHours(context),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 22),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                      child: _restartWorkButton(context)
                  ),
                ],
              ),
            ]),
      ),
    );
  }

  _addNotesButton(context){
    return TextButton(
        onPressed: (){
          showDialog(
            context: context,
            builder: (BuildContext context) => AttendanceDescriptionDialog(currentText: notes,),
          );
        },
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Add notes', style: Theme.of(context).textTheme.titleMedium),
            SizedBox(width: 4),
            Icon(Icons.note_add_outlined, color: Colors.black54, size: 22),
          ],
        ),);
  }

  _attendanceStateText(state) {
    if (state == "working"){
      return Container(
        padding: EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 2),
        decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.all(Radius.circular(4))
        ),
        child: Text("Currently working", style: TextStyle( color: Colors.white, fontSize: 12),),
      );
    }

    if (state == "on break"){
      return Container(
        padding: EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 2),
        decoration: BoxDecoration(
            color: Colors.redAccent,
            borderRadius: BorderRadius.all(Radius.circular(4))
        ),
        child: Text("Currently on break", style: TextStyle( color: Colors.white, fontSize: 12),),
      );
    }

    return Container(
      height: 32,
      padding: EdgeInsets.all(4),
      child: Text("You are currently NOT working"),
    );
  }

  _completeButton(context) {
    return FilledButton(
      onPressed: () {
        showModalBottomSheet(
            isScrollControlled: true,
            enableDrag: false,
            showDragHandle: true,
            useRootNavigator: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
            ),
            context: context, builder: (context) {
            return CustomBottomSheet(
              bottomSheetType: BottomSheetType.finishSheet,
              onPressed: () async{
                await showDialog(
            context: context,
            builder: (context) =>
                FutureProgressDialog(completeAttendance(context, ''),
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
          },);
        // completeAttendance(context);
      },
      child: const Text("Finish Sheet"),
    );
  }

  _workedHours(context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(totalWorkingHours.toString() + " h", style: TextStyle(fontSize: 44),),
        // Text("Working", style: TextStyle(fontSize: 14),),
      ],
    );
  }
  
  _breakHours(context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(totalBreakHours.toString(), style: TextStyle(fontSize: 56),),
        Text("Break", style: TextStyle(fontSize: 14),),
      ],
    );
  }

  _startedHour(context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //Text("started", style: TextStyle(fontSize: 10, color: Colors.grey),),
        Text(
          formatDateTime(startedAt),
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ],
    );
  }

  _breakButton(context) {
    return FilledButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(AppThemeColors.failure),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white)),
        onPressed: () async {
          showModalBottomSheet(
            isScrollControlled: true,
            enableDrag: false,
            showDragHandle: true,
            useRootNavigator: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
            ),
            context: context, builder: (context) {
            return CustomBottomSheet(
              bottomSheetType: BottomSheetType.takeABreak,
              onPressed: () async{
                await showDialog(
            context: context,
            builder: (context) =>
                FutureProgressDialog(pauseAttendance(context),
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
          },);
          
        },
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Icon(Icons.timer_off_outlined, color: Colors.white, size: 18,),
            SizedBox(width: 8),
            Text('Take break', style: TextStyle(color: Colors.white)),
          ],
        ),
    );
  }

  _startWorkButton(context) {
    return Container(
      child:  FilledButton(
          onPressed: () {
            createAttendance(context);
          },
          child: const Text("Start Working")),
    );
  }

  _restartWorkButton(context) {
    return FilledButton(
        onPressed: () async {
          showModalBottomSheet(
            isScrollControlled: true,
            enableDrag: false,
            showDragHandle: true,
            useRootNavigator: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
            ),
            context: context, builder: (context) {
              return CustomBottomSheet(
                bottomSheetType: BottomSheetType.backToWork,
                onPressed: () async{
                  await showDialog(
                 context: context,
                 builder: (context) =>
                FutureProgressDialog(startAttendance(context),
                  progress: const CircularProgressIndicator(),
                  opacity: 0.7,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                ),),
          );
          Navigator.pop(context);
                },
                );
            
          },);
          
        },
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.timer_outlined, color: Colors.white, size: 18,),
            SizedBox(width: 8),
            Text('Back to work', style: TextStyle(color: Colors.white)),
          ],
        ),
    );
  }

  _totalsHours(context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(Icons.timer_outlined, size: 18),
            SizedBox(width: 6,),
            Text(totalWorkingHours.toString(), style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text(" working hours", style: TextStyle(fontSize: 18),),
          ],
        ),

        SizedBox(height: 8),

        Row(
          children: [
            Icon(Icons.timer_off_outlined, size: 18,),
            SizedBox(width: 6,),
            Text(totalBreakHours.toString(), style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text(" break hours", style: TextStyle(fontSize: 18)),
          ],
        ),
        
        SizedBox(height: 8,),

        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.location_on_outlined, size: 20,),
            SizedBox(width: 6,),
            Container(
              width: MediaQuery.sizeOf(context).width * 0.7,
              child: projectData['location'] == ''
                     ?Text('Location not tracked')
                     :Text(projectData['location'],maxLines: 2, 
                      style: TextStyle(fontSize: 18),overflow: TextOverflow.ellipsis,)),
          ])

      ],
    );
  }
// this is dead code and need to be removed
  Future createAttendance(context) async {
    final position = Provider.of<LocationService>(context, listen: false).center;
    final address = Provider.of<LocationService>(context, listen: false).address;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final response = await http.post(
      Uri.parse('${Server.baseURL}/api/v1/attendance/new'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': prefs.getString('token') ?? ""
      },
      body: jsonEncode({"project_id": _controller.selectedOptions[0].value,
      "location":{
        "longitude":position.longitude,
        "latitude": position.latitude,
        "address": address
      }}
        ),
    );

    if (response.statusCode == 200) {
      prefs.setInt(
          "attendance_id", int.parse(jsonDecode(response.body)["data"]["id"]));
      Alert.awesomeSnackBar(
          message: 'Sheet Started', type: AWESOMESNACKBARTYPE.success);
    } else {
      Alert.awesomeSnackBar(
          message: 'Error', type: AWESOMESNACKBARTYPE.failure);
    }
    Provider.of<AppService>(context, listen: false).attendanceState("working");
  }

  Future pauseAttendance(context) async {
    final position = Provider.of<LocationService>(context, listen: false).center;
    final address = Provider.of<LocationService>(context, listen: false).address;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final response = await http.post(
      Uri.parse('${Server.baseURL}/api/v1/attendance/pause'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': prefs.getString('token') ?? ""
      },
      body: jsonEncode({'attendance_id': prefs.getInt("attendance_id"),
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
     snackBar =  Alert.awesomeSnackBar(
          message: 'Sheet Paused', type: AWESOMESNACKBARTYPE.success);
          Provider.of<AppService>(context, listen: false).attendanceState("on break");
    } else {
     snackBar =  Alert.awesomeSnackBar(
          message: message['message'], type: AWESOMESNACKBARTYPE.failure);
    }
    if (!context.mounted) return;
    ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(snackBar);
  }

  Future startAttendance(context) async {
    final position = Provider.of<LocationService>(context, listen: false).center;
    final address = Provider.of<LocationService>(context, listen: false).address;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final response = await http.post(
      Uri.parse('${Server.baseURL}/api/v1/attendance/start'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': prefs.getString('token') ?? ""
      },
      body: jsonEncode({'attendance_id': prefs.getInt("attendance_id"),
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
     snackBar = Alert.awesomeSnackBar(
          message: 'Sheet restarted', type: AWESOMESNACKBARTYPE.success);
      Provider.of<AppService>(context, listen: false).attendanceState("start");    
    } else {
     snackBar = Alert.awesomeSnackBar(
          message: message['message'], type: AWESOMESNACKBARTYPE.failure);
    }
    if (!context.mounted) return;
    ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(snackBar);
  }

  Future completeAttendance(context, description) async {
    final position = Provider.of<LocationService>(context, listen: false).center;
    final address = Provider.of<LocationService>(context, listen: false).address;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final response = await http.post(
      Uri.parse('${Server.baseURL}/api/v1/attendance/complete'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': prefs.getString('token') ?? ""
      },
      body: jsonEncode({'attendance_id': prefs.getInt("attendance_id"), 'description': description,
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
      prefs.remove("attendance_id");
      Provider.of<AppService>(context, listen: false).attendanceState("completed");
     snackBar = Alert.awesomeSnackBar(
          message: 'Sheet Completed', type: AWESOMESNACKBARTYPE.success);
    } else {
     snackBar = Alert.awesomeSnackBar(message: message['message'], type: AWESOMESNACKBARTYPE.failure);
    }
    if (!context.mounted) return;
    ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(snackBar);
  }
}


