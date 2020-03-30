import 'package:boilerplate_flutter_nafanesia/data/local/database.dart';
import 'package:boilerplate_flutter_nafanesia/flavor.dart';
import 'package:boilerplate_flutter_nafanesia/locator.dart';
import 'package:boilerplate_flutter_nafanesia/models/user.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:boilerplate_flutter_nafanesia/constants/string.dart';
import 'package:boilerplate_flutter_nafanesia/screens/routes.dart';
import 'package:provider/provider.dart';

void main() {
  setupLocator();
  runApp(DevicePreview(
    enabled: flavor == FlavorEnum.PROD
        ? false
        : true, // Ensures that it is disabled in release mode
    builder: (context) => MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider(
      initialData: User.initial(),
      create: (_) => locator<Sqlite>().userController.stream,
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
