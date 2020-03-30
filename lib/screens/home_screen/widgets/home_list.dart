import 'package:boilerplate_flutter_nafanesia/data/network/api/posts_api/posts_api.dart';
import 'package:boilerplate_flutter_nafanesia/screens/home_screen/widgets/course_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
