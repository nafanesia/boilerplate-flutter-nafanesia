import 'package:boilerplate_flutter_nafanesia/constants/colors.dart';
import 'package:boilerplate_flutter_nafanesia/constants/images.dart';
import 'package:boilerplate_flutter_nafanesia/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Container(
              color: MyColors.lightGrey,
              padding: EdgeInsets.only(
                left: MySize.paddingWidthMedium,
                top: 40.h,
                right: MySize.paddingWidthMedium,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Welcome,",
                            style: TextStyle(
                                fontSize: MySize.fontLarge,
                                fontWeight: FontWeight.w300),
                          ),
                          Text("Dena Meidina",
                              style: TextStyle(
                                  fontSize: MySize.fontLarge,
                                  fontWeight: FontWeight.w700)),
                        ],
                      ),
                      CircleAvatar(
                        radius: 30.w,
                        backgroundColor: Colors.transparent,
                        child: Image.asset(
                          MyImages.avatar1,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: MySize.paddingHeightLarge,
                  ),
                  TextFormField(
                    maxLines: 1,
                    textAlignVertical: TextAlignVertical.center,
                    style: TextStyle(
                      fontSize: MySize.fontDefault,
                    ),
                    decoration: InputDecoration(
                      hintText: "Search Course",
                      fillColor: MyColors.white,
                      filled: true,
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: MySize.paddingWidthMedium),
                      border: InputBorder.none,
                      suffixIcon: Icon(
                        Icons.search,
                        color: MyColors.darkGrey,
                        size: MySize.iconDefault,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverAppBar(
            backgroundColor: MyColors.lightGrey,
            pinned: true,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Recomended Course",
                  style: TextStyle(
                      color: MyColors.black,
                      fontSize: MySize.fontDefault,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  "Sell All",
                  style: TextStyle(
                      color: MyColors.primary,
                      decoration: TextDecoration.underline,
                      fontSize: MySize.fontDefault,
                      fontWeight: FontWeight.w700),
                )
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return ListCourse();
              },
              childCount: 5,
            ),
          ),
        ],
      ),
    );
  }
}

class ListCourse extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: MySize.paddingWidthMedium,
          right: MySize.paddingWidthMedium,
          bottom: MySize.paddingWidthMedium),
      padding: EdgeInsets.all(MySize.paddingWidthMedium),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.w),
        gradient: MyColors.getGradient(MyColors.lightBlue, MyColors.darkBlue),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              CircleAvatar(
                radius: 35.w,
                backgroundColor: MyColors.white,
                child: Image.asset(MyImages.logo_flutter),
              ),
              Column(
                children: <Widget>[
                  Icon(
                    Icons.favorite,
                    color: MyColors.white,
                    size: MySize.iconDefault,
                  ),
                  Text(
                    '1.1k',
                    style: TextStyle(color: MyColors.white, fontSize: 10.ssp),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: MySize.paddingHeightMedium,
          ),
          Text(
            "Flutter Beginer",
            style: TextStyle(
                color: MyColors.white,
                fontSize: 20.ssp,
                fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: MySize.paddingHeightSmall,
          ),
          Text(
            "Learn flutter from zero to hero, with good method and clean code",
            style: TextStyle(
                color: MyColors.white,
                fontSize: 16.ssp,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 32.h,
          ),
          Row(
            children: <Widget>[
              CircleAvatar(
                radius: 20.w,
                child: Image.asset(MyImages.avatar1),
              ),
              SizedBox(
                width: MySize.paddingWidthSmall,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Dena Meidina",
                    style: TextStyle(
                        fontSize: 12.ssp,
                        fontWeight: FontWeight.w500,
                        color: MyColors.white),
                  ),
                  Text(
                    "Flutter Developer",
                    style: TextStyle(fontSize: 10.ssp, color: MyColors.white),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
