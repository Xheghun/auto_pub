import 'dart:math';
import 'package:auto_pub/core/data_models/post.dart';
import 'package:auto_pub/core/enums/view_state.dart';
import 'package:auto_pub/core/services/api.dart';
import 'package:auto_pub/core/viewmodels/base_viewmodel.dart';
import 'package:auto_pub/locator.dart';

class HomeViewModel extends BaseViewModel {
  Api _api = locator<Api>();
  List<Post> posts;
  void getPosts(int userId) async {
    setState(ViewState.Busy);
    int rand = Random(1).nextInt(10);
    posts = await _api.getPostsForUser(rand);
    print("17 home_viewmodel.dart: get post called user id is: $userId");
    setState(ViewState.Idle);
  }
}