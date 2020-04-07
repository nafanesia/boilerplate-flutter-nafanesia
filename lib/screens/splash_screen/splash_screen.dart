import 'package:boilerplate_flutter_nafanesia/constants/my_images.dart';
import 'package:boilerplate_flutter_nafanesia/constants/my_sizes.dart';
import 'package:boilerplate_flutter_nafanesia/data/local/sqlite.dart';
import 'package:boilerplate_flutter_nafanesia/locator.dart';
import 'package:boilerplate_flutter_nafanesia/models/user.dart';
import 'package:boilerplate_flutter_nafanesia/routes/routes.dart';
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
        _sqlite.addUserStreamController(user);
        Routes.pushReplace(context, PathRoute.home);
      } else {
        Routes.pushReplace(context, PathRoute.login);
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
