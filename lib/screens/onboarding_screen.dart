import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../router/route_utils.dart';
import '../services/app_service.dart';
import '../widgets/app_bar_widget.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appService = Provider.of<AppService>(context);
    return Scaffold(
      appBar: AppBarWidget(title: SCREENS.onBoarding.toTitle),
      body: Center(
        child: TextButton(
          onPressed: () {
            appService.onboarding = true;
          },
          child: const Text("Done")
        ),
      ),
    );
  }
}
