import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../router/route_utils.dart';
import '../widgets/app_bar_widget.dart';

class ErrorScreen extends StatelessWidget {
  final String? error;
  const ErrorScreen({
    Key? key,
    this.error,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: SCREENS.error.toTitle),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(error ?? ""),
            TextButton(
              onPressed: () {
                GoRouter.of(context).goNamed(SCREENS.dashboard.toName);
              },
              child: const Text("Back to Home"),
            ),
          ],
        ),
      ),
    );
  }
}
