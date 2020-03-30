import 'package:boilerplate_flutter_nafanesia/data/network/api/posts/posts_api.dart';
import 'package:boilerplate_flutter_nafanesia/enums/view_state.dart';
import 'package:boilerplate_flutter_nafanesia/screens/base_screen.dart';
import 'package:boilerplate_flutter_nafanesia/screens/home_screen/home_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen<PostsApi>(
      initState: (model) => model.getPosts(),
      builder: (_, model, __) => Scaffold(
        body: model.state == ViewState.BUSY
            ? Center(
                child: CircularProgressIndicator(),
              )
            : CustomScrollView(
                slivers: <Widget>[
                  HomeBanner(),
                  HomeAppBar(),
                  HomeList(),
                ],
              ),
      ),
    );
  }
}
