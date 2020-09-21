import 'package:auto_pub/core/data_models/comment.dart';
import 'package:auto_pub/core/services/api.dart';
import 'package:auto_pub/core/viewmodels/base_viewmodel.dart';
import 'package:auto_pub/locator.dart';
class CommentsViewModel extends BaseViewModel {
  Api _api = locator<Api>();

  List<Comment> comments;

  Future fetchComments(int postId) async {
    setState(ViewState.Busy);
    comments = await _api.getCommentsForPost(postId);
    setState(ViewState.Idle);
  }
}