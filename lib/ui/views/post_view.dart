import 'package:auto_pub/core/data_models/post.dart';
import 'package:auto_pub/core/data_models/user.dart';
import 'package:auto_pub/ui/shared/app_colors.dart';
import 'package:auto_pub/ui/shared/text_styles.dart';
import 'package:auto_pub/ui/shared/ui_helpers.dart';
import 'package:auto_pub/ui/widgets/comments.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostView extends StatelessWidget {
  final Post post;
  PostView({this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UIHelper.verticalSpaceLarge(),
            Text(post.title,style: headerStyle,),
            Text('by ${Provider.of<User>(context).name}',
            style: TextStyle(fontSize: 9.0),),
            UIHelper.verticalSpaceMedium(),
            Text(post.body),
            Comments(post.id)
          ],
        ),
      ),
    );
  }
}
