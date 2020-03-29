import 'package:boilerplate_flutter_nafanesia/data/repository.dart';
import 'package:boilerplate_flutter_nafanesia/locator.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:boilerplate_flutter_nafanesia/constants/string.dart';
import 'package:boilerplate_flutter_nafanesia/screens/routes.dart';
import 'package:provider/provider.dart';

void main() {
  setupLocator();
  runApp(DevicePreview(
    enabled: false, // Ensures that it is disabled in release mode
    builder: (context) => MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => Repository(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
        title: kAppName,
        routes: Routes.routes,
        initialRoute: Routes.splash,
      ),
    );
  }
}
