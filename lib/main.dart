import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testproject/app.dart';
import 'package:testproject/ui/mainscreen.dart';
import 'package:testproject/ui/setSchedulescreen.dart';
import 'package:testproject/ui/solarScreening.dart';
import 'package:testproject/ui/startCleaning.dart';
import 'package:testproject/ui/statistics.dart';
import 'package:testproject/ui/statusscreen.dart';
import 'package:testproject/utils/config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(name: AppLinks.mainscreen.path, page: () => mainscreen()),
        GetPage(name: AppLinks.setSchedulescreen.path, page: () => setSchedulescreen()),
        GetPage(name: AppLinks.startCleaning.path, page: () => startCleaning()),
        GetPage(name: AppLinks.solarScreening.path, page: () => solarScreening()),
        GetPage(name: AppLinks.statistics.path, page: () => statistics()),
      ],
      home: const MainScreen(),
    );
  }
}
