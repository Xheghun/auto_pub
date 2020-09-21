import 'dart:async';

import 'package:auto_pub/core/data_models/post.dart';
import 'package:auto_pub/core/services/api.dart';
import 'package:auto_pub/core/viewmodels/base_viewmodel.dart';
import 'package:auto_pub/locator.dart';

class HomeViewModel extends BaseViewModel {
  Api _api = locator<Api>();

  List<Post> posts;

  Future getPosts(int userId) async {
    setState(ViewState.Busy);
    posts = await _api.getPostsForUser(userId);
    setState(ViewState.Idle);
  }
}