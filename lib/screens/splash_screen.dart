import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../router/route_utils.dart';
import '../services/app_service.dart';
import '../widgets/app_bar_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late AppService _appService;

  @override
  void initState() {
    _appService = Provider.of<AppService>(context, listen: false);
    onStartUp();
    super.initState();
  }

  void onStartUp() async {
    await _appService.onAppStart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: SCREENS.splash.toTitle),
      body: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
