import 'package:boilerplate_flutter_nafanesia/constants/colors.dart';
import 'package:boilerplate_flutter_nafanesia/constants/images.dart';
import 'package:boilerplate_flutter_nafanesia/constants/sizes.dart';
import 'package:boilerplate_flutter_nafanesia/data/network/results/result.dart';
import 'package:boilerplate_flutter_nafanesia/data/repository.dart';
import 'package:boilerplate_flutter_nafanesia/screens/routes.dart';
import 'package:boilerplate_flutter_nafanesia/widget/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Result(),
      child: Scaffold(
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
  String username;
  String password;

  bool isLoading;

  Repository _repository;

  @override
  void initState() {
    super.initState();
    isLoading = false;

    _repository = Provider.of<Repository>(context, listen: false);
  }

  void submit(BuildContext context) async {
    setState(() {
      isLoading = true;
    });
    Result result =
        await _repository.login(email: username, password: password);
    if (result.data != null) {
      Routes.pushReplace(context, Routes.home);
    } else {
      if (result.error.isResponse) {
        // TODO : do something with respone error
      } else {
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text(result.error.message),
          ),
        );
      }
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                submit(context);
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  20.w,
                ),
              ),
              color: MyColors.primary,
              child: isLoading
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
  }
}
