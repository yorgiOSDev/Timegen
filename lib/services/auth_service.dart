import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/constants.dart';

class AuthService {
  final StreamController<bool> _onAuthStateChange =
      StreamController.broadcast();

  // getter
  Stream<bool> get onAuthStateChange => _onAuthStateChange.stream;

  // methods
  Future<bool> login(email, password) async {
    // This is just to demonstrate the login process time.
    // In real-life applications, it is not recommended to interrupt the user experience by doing such things.
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final response = await http.post(
      Uri.parse('${Server.baseURL}/api/v1/signin'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'sign_in': {"email": email, "password": password}
      }),
    );

    if (response.statusCode == 200) {
      var token = jsonDecode(response.body)["token"];
      prefs.setString('token', 'Bearer $token');
      _onAuthStateChange.add(true);
      return true;
    }
    _onAuthStateChange.add(false);
    return false;
  }

  void logOut() {
    _onAuthStateChange.add(false);
  }
}
