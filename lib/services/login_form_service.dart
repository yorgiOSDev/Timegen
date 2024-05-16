import 'package:flutter/foundation.dart';

class LoginFormService with ChangeNotifier {
  bool _showPassword = true;

  // getter
  bool get showPassword => _showPassword;

  // setter
  set setShowPassword(bool value) {
    _showPassword = value;
    notifyListeners();
  }

  // methods
  void switchShowPassword(bool value) => setShowPassword = value;
}
