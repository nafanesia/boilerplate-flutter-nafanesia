import 'package:boilerplate_flutter_nafanesia/utils/dio/response_api.dart';
import 'package:boilerplate_flutter_nafanesia/data/network/service/posts_service.dart';
import 'package:boilerplate_flutter_nafanesia/enums/view_state.dart';
import 'package:boilerplate_flutter_nafanesia/models/post.dart';

import '../../../locator.dart';
import 'base_api.dart';

class PostsApi extends BaseApi {
  PostsService _postsService = locator<PostsService>();

  List<Post> posts;

  Future getPosts() async {
    setState(ViewState.BUSY);
    ResponseApi responseApi = await _postsService.getPosts();
    if (responseApi.data != null) {
      posts =
          responseApi.data.map<Post>((json) => Post.fromJson(json)).toList();
    } else {
      setError(responseApi.error);
    }
    setState(ViewState.IDLE);
  }
}
