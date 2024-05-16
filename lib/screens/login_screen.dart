import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/responsive/responsive_layout.dart';
import '../widgets/login/login_brand_widget.dart';
import '../widgets/login/login_form_widget.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({Key? key}) : super(key: key);
  final animateDuration = const Duration(seconds: 1);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final Scaffold mobileAndTabletScaffold = Scaffold(
      backgroundColor: Color.fromRGBO(34, 19, 43, 1),
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Color.fromRGBO(34, 19, 43, 1),
        systemOverlayStyle: SystemUiOverlayStyle.light.copyWith(statusBarIconBrightness: Brightness.light),
        ),
      body: FadeIn(
      duration: animateDuration,
      child: Container(
        color: Color.fromRGBO(34, 19, 43, 1),
        child: Center(
          child: LoginBrandWidget(
            child: SlideInLeft(
              duration: animateDuration,
              child: SingleChildScrollView(
                reverse: true,
                child: LoginFormWidget()),
            ),
          ),
        ),
      )
    ));
    final Scaffold desktopScaffold = Scaffold(
      body: Row(
        children: [
          Container(
            color: Colors.lightGreenAccent,
            child: Column(
              children: [
                Expanded(
                  child: SlideInLeft(
                      duration: animateDuration,
                      child: LoginFormWidget(formWidth: 1024.0)),
                ),
                Expanded(
                  child: SlideInRight(
                    duration: animateDuration,
                    child: const LoginBrandWidget(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [],
                      ),
                    ),
                  ),
                )
              ],
            ),
          )

        ],
      ),
    );
    return Scaffold(
        // appBar: AppBarWidget(title: SCREENS.login.toTitle),
        body: ResponsiveLayout(
      mobileScaffold: mobileAndTabletScaffold,
      tabletScaffold: mobileAndTabletScaffold,
      desktopScaffold: desktopScaffold,
    ));
  }
}
