import 'package:flutter/material.dart';

enum AppLinks {
  mainscreen,
  setSchedulescreen,
  startCleaning,
  solarScreening,
  statusscreen,
  statistics
}

extension AppLinksExtenstion on AppLinks {
  String get path {
    switch(this) {
      case AppLinks.mainscreen:
        return '/';
      case AppLinks.setSchedulescreen:
        return '/setSchedulescreen';
      case AppLinks.startCleaning:
        return '/startCleaning';
      case AppLinks.solarScreening:
        return '/solarScreening';
      case AppLinks.statistics:
        return '/statistics';
      default:
        return '/';
    }
  }
}