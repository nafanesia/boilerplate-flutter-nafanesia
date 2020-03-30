import 'package:boilerplate_flutter_nafanesia/constants/images.dart';
import 'package:boilerplate_flutter_nafanesia/constants/sizes.dart';
import 'package:boilerplate_flutter_nafanesia/data/local/database.dart';
import 'package:boilerplate_flutter_nafanesia/locator.dart';
import 'package:boilerplate_flutter_nafanesia/models/user.dart';
import 'package:boilerplate_flutter_nafanesia/screens/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _sqlite = locator<Sqlite>();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 1000), () async {
      User user = await _sqlite.getUser();
      if (user != null) {
        //add to stream
        _sqlite.addUser(user);
        Routes.pushReplace(context, Routes.home);
      } else {
        Routes.pushReplace(context, Routes.login);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        width: MySize.defaultScreenWidth,
        height: MySize.defaultScreenHeight,
        allowFontScaling: MySize.allowFontScalling);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Image.asset(
            MyImages.logo,
            width: 200.w,
          ),
        ),
      ),
    );
  }
}
