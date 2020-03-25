import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:boilerplate_flutter_nafanesia/constants/string.dart';
import 'package:boilerplate_flutter_nafanesia/screens/routes.dart';

void main() => runApp(DevicePreview(
      enabled: false, // Ensures that it is disabled in release mode
      builder: (context) => MyApp(),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      title: kAppName,
      routes: Routes.routes,
      initialRoute: Routes.splash,
    );
  }
}