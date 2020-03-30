import 'package:boilerplate_flutter_nafanesia/constants/colors.dart';
import 'package:boilerplate_flutter_nafanesia/constants/images.dart';
import 'package:boilerplate_flutter_nafanesia/constants/sizes.dart';
import 'package:boilerplate_flutter_nafanesia/data/network/api/posts/posts_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CourseItem extends StatelessWidget {
  final int index;

  CourseItem({@required this.index});

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
            Provider.of<PostsApi>(context).posts[index].title,
            style: TextStyle(
                color: MyColors.white,
                fontSize: 20.ssp,
                fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: MySize.paddingHeightSmall,
          ),
          Text(
            Provider.of<PostsApi>(context).posts[index].body,
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
