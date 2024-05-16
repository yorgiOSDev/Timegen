import 'package:flutter/material.dart';

import '../utils/constants.dart';

enum SCREENS {
  splash,
  onBoarding,
  login,
  dashboard,
  profile,
  myProfile,
  settings,
  logout,
  error,
  attendances,
  routines
}

extension AppScreenExtension on SCREENS {
  String get toPath {
    switch (this) {
      case SCREENS.dashboard:
        return "/";
      case SCREENS.profile:
        return "/profile";
      case SCREENS.myProfile:
        return "my-profile";
      case SCREENS.settings:
        return "/settings";
      case SCREENS.login:
        return "/login";
      case SCREENS.logout:
        return "/logout";
      case SCREENS.splash:
        return "/splash";
      case SCREENS.error:
        return "/error";
      case SCREENS.onBoarding:
        return "/start";
      case SCREENS.attendances:
        return "/attendances";
      case SCREENS.routines:
        return "/routines";
      default:
        return "/";
    }
  }

  String get toName {
    switch (this) {
      case SCREENS.dashboard:
        return "dashboard";
      case SCREENS.profile:
        return "profile";
      case SCREENS.myProfile:
        return "myProfile";
      case SCREENS.settings:
        return "settings";
      case SCREENS.login:
        return "login";
      case SCREENS.splash:
        return "splash";
      case SCREENS.error:
        return "error";
      case SCREENS.onBoarding:
        return "start";
      case SCREENS.attendances:
        return "Attendances";
      case SCREENS.routines:
        return "HSE Routines";
      default:
        return "dashboard";
    }
  }

  String get toTitle {
    switch (this) {
      case SCREENS.dashboard:
        return "screens.dashboard.title";
      case SCREENS.profile:
        return "screens.profile.title";
      case SCREENS.myProfile:
        return "screens.profile.children.myProfile.title";
      case SCREENS.settings:
        return "screens.settings.title";
      case SCREENS.login:
        return "screens.login.title";
      case SCREENS.logout:
        return "screens.logout.title";
      case SCREENS.splash:
        return "screens.splash.title";
      case SCREENS.error:
        return "screens.error.title";
      case SCREENS.onBoarding:
        return "screens.onBoarding.title";
      case SCREENS.attendances:
        return "screens.attendances.title";
      case SCREENS.routines:
        return "screens.routines.title";
      default:
        return "screens.dashboard.title";
    }
  }

  IconData get toIcon {
    switch (this) {
      case SCREENS.dashboard:
        return AppDefaultIcons.dashboard;
      case SCREENS.profile:
        return AppDefaultIcons.profile;
      case SCREENS.myProfile:
        return AppDefaultIcons.profile;
      case SCREENS.settings:
        return AppDefaultIcons.settings;
      case SCREENS.login:
        return AppDefaultIcons.login;
      case SCREENS.logout:
        return AppDefaultIcons.logout;
      case SCREENS.splash:
        return AppDefaultIcons.splashScreen;
      case SCREENS.error:
        return AppDefaultIcons.error;
      case SCREENS.onBoarding:
        return AppDefaultIcons.onBoarding;
      case SCREENS.routines:
        return AppDefaultIcons.routines;
      case SCREENS.attendances:
        return AppDefaultIcons.onBoarding;
      default:
        return AppDefaultIcons.dashboard;
    }
  }
}
