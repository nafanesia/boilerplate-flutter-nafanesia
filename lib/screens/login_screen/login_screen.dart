import 'package:boilerplate_flutter_nafanesia/constants/colors.dart';
import 'package:boilerplate_flutter_nafanesia/constants/images.dart';
import 'package:boilerplate_flutter_nafanesia/constants/sizes.dart';
import 'package:boilerplate_flutter_nafanesia/data/network/api/login/login_api.dart';
import 'package:boilerplate_flutter_nafanesia/enums/view_state.dart';
import 'package:boilerplate_flutter_nafanesia/screens/base_screen.dart';
import 'package:boilerplate_flutter_nafanesia/screens/routes.dart';
import 'package:boilerplate_flutter_nafanesia/widget/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseScreen<LoginApi>(
      builder: (_, model, __) => Scaffold(
        resizeToAvoidBottomPadding: false,
        body: LoginContainer(),
      ),
    );
  }
}

class LoginContainer extends StatefulWidget {
  @override
  _LoginContainerState createState() => _LoginContainerState();
}

class _LoginContainerState extends State<LoginContainer> {
  String email;
  String password;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginApi>(
      builder: (_, model, __) {
        return Container(
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
                    email = newValue;
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
                  onPressed: () async {
                    await model.login(email: email, password: password);
                    if (model.errorMessage != null) {
                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text(model.errorMessage),
                      ));
                    }
                    //dummy for
                    if (model.user != null) {
                      Routes.pushReplace(context, Routes.home);
                    }
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      20.w,
                    ),
                  ),
                  color: MyColors.primary,
                  child: model.state == ViewState.BUSY
                      ? SizedBox(
                          width: 20.w,
                          height: 20.w,
                          child: CircularProgressIndicator())
                      : Text(
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
        );
      },
    );
  }
}
