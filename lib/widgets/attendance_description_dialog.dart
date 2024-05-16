import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:future_progress_dialog/future_progress_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../utils/alert/alert.dart';
import '../utils/alert/awesome_snack_bar_utils.dart';
import '../utils/constants.dart';

class AttendanceDescriptionDialog extends StatelessWidget {
  String currentText;
  final descriptionController = TextEditingController();
  AttendanceDescriptionDialog({required this.currentText});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    descriptionController.text = currentText;

    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme
            .of(context)
            .brightness == Brightness.dark ? Colors.grey.shade900 : Colors
            .white,
        shape: BoxShape.rectangle,
        border: Border.all(
            color: Theme
                .of(context)
                .brightness == Brightness.dark ? Color(0xFFB7D270) : Color(
                0xff51661B)
        ),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Theme
                .of(context)
                .brightness == Brightness.dark ? Colors.grey.shade900 : Colors
                .transparent,
            blurRadius: 10.0,
            offset: Offset(0.0, 10.0),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Description of the work',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),

          Container(
            height: 168,
            child: TextField(
              keyboardType: TextInputType.multiline,
              maxLines: 10,
              controller: descriptionController,
              decoration: InputDecoration(
                hintText: 'Description of the work done here..',
              ),
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FilledButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        AppThemeColors.failure),
                    foregroundColor: MaterialStateProperty.all<Color>(
                        Colors.white)),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Cancelar'),
              ),
              const SizedBox(width: 16),
              FilledButton(
                onPressed: () async {
                  await showDialog(
                    context: context,
                    builder: (context) =>
                        FutureProgressDialog(updateNotes(
                            context, descriptionController.text).then((_) {
                          Navigator.of(context).pop();
                        }).catchError((error) {}),
                          progress: const CircularProgressIndicator(),
                          opacity: 0.7,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.all(
                                Radius.circular(4)),
                          ),
                        ),
                    );
                },
                child: Text('Aceptar'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future updateNotes(context, description) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final response = await http.post(
      Uri.parse('${Server.baseURL}/api/v1/attendance/notes'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': prefs.getString('token') ?? ""
      },
      body: jsonEncode({
        'attendance_id': prefs.getInt("attendance_id"),
        'description': description
      }),
    );
    final message = jsonDecode(response.body);
    late SnackBar snackBar;
    if (response.statusCode == 200) {
      snackBar = Alert.awesomeSnackBar(
          message: 'Notes updated', type: AWESOMESNACKBARTYPE.success);
    } else {
      snackBar = Alert.awesomeSnackBar(
          message: message['message'], type: AWESOMESNACKBARTYPE.failure);
    }
    if (!context.mounted) return;
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}