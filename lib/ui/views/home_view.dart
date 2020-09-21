import 'package:auto_pub/core/data_models/post.dart';
import 'package:auto_pub/core/data_models/user.dart';
import 'package:auto_pub/core/viewmodels/base_viewmodel.dart';
import 'package:auto_pub/core/viewmodels/home_viewmodel.dart';
import 'package:auto_pub/ui/shared/app_colors.dart';
import 'package:auto_pub/ui/shared/text_styles.dart';
import 'package:auto_pub/ui/shared/ui_helpers.dart';
import 'package:auto_pub/ui/widgets/postlist_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'base_view.dart';

class HomeView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      onModelReady: (model) {
        model.getPosts(Provider.of<User>(context).id);
      },
      builder: (context,model,child) => Scaffold(
        backgroundColor: backgroundColor,
        body: model.state == ViewState.Idle ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UIHelper.verticalSpaceLarge(),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text('Welcome ${Provider.of<User>(context).name}', style: headerStyle,),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Here are all your post',style: subHeaderStyle,),
            ),
            UIHelper.verticalSpaceSmall(),
            Expanded(
              child: getPostsUi(model.posts),
            )
          ],
        ) : Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

Widget getPostsUi(List<Post> posts) => ListView.builder(
  itemCount: posts.length,
  itemBuilder: (context,index)  =>PostListItem(
    post: posts[index],
    onTap: () {
      Navigator.pushNamed(context, 'post',arguments: posts[index]);
    },
  ),
);