import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class LoginBrandWidget extends StatelessWidget {
  final Widget? child;
  const LoginBrandWidget({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(AppStyleDefaultProperties.p),
        child: child);
  }
}
