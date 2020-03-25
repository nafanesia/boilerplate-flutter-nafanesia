import 'package:boilerplate_flutter_nafanesia/constants/images.dart';
import 'package:boilerplate_flutter_nafanesia/constants/sizes.dart';
import 'package:boilerplate_flutter_nafanesia/screens/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 1000), () {
      Routes.pushReplace(context, Routes.login);
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
