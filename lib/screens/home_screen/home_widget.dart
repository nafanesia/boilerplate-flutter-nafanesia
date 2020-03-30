import 'package:boilerplate_flutter_nafanesia/constants/colors.dart';
import 'package:boilerplate_flutter_nafanesia/constants/images.dart';
import 'package:boilerplate_flutter_nafanesia/constants/sizes.dart';
import 'package:boilerplate_flutter_nafanesia/data/network/api/posts/posts_api.dart';
import 'package:boilerplate_flutter_nafanesia/screens/home_screen/course_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
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
    );
  }
}

class HomeBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
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
                contentPadding:
                    EdgeInsets.symmetric(horizontal: MySize.paddingWidthMedium),
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
    );
  }
}

class HomeList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return CourseItem(
            index: index,
          );
        },
        childCount: Provider.of<PostsApi>(context).posts.length,
      ),
    );
  }
}
