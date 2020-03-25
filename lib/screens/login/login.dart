import 'package:boilerplate_flutter_nafanesia/constants/colors.dart';
import 'package:boilerplate_flutter_nafanesia/constants/images.dart';
import 'package:boilerplate_flutter_nafanesia/constants/sizes.dart';
import 'package:boilerplate_flutter_nafanesia/screens/routes.dart';
import 'package:boilerplate_flutter_nafanesia/widget/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String username;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(MyImages.bgLogin),
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(MySize.paddingWidthMedium),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Username",
                style: TextStyle(
                    fontSize: MySize.fontDefault, color: MyColors.darkGrey),
              ),
              SizedBox(
                height: MySize.paddingHeightMedium,
              ),
              TextFieldWidget(onChange: (newValue) {
                setState(() {
                  username = newValue;
                });
              }),
              SizedBox(
                height: MySize.paddingHeightMedium,
              ),
              Text(
                "Password",
                style: TextStyle(
                    fontSize: MySize.fontDefault, color: MyColors.darkGrey),
              ),
              SizedBox(
                height: MySize.paddingHeightMedium,
              ),
              TextFieldWidget(onChange: (newValue) {
                setState(() {
                  password = newValue;
                });
              }),
              SizedBox(
                height: 80.h,
              ),
              FlatButton(
                onPressed: () {
                  print(username);
                  Routes.pushReplace(context, Routes.home);
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    20.w,
                  ),
                ),
                color: MyColors.primary,
                child: Text(
                  "Login",
                  style: TextStyle(
                      color: MyColors.white,
                      fontSize: MySize.fontMedium,
                      fontWeight: FontWeight.w700),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: MySize.paddingHeightMedium,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
