import 'package:auto_pub/core/data_models/post.dart';
import 'package:auto_pub/ui/views/home_view.dart';
import 'package:auto_pub/ui/views/login_view.dart';
import 'package:auto_pub/ui/views/post_view.dart';
import 'package:flutter/material.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':return MaterialPageRoute(builder: (_) => HomeView());
      case 'login':
        return MaterialPageRoute(builder: (_) => LoginView());
      case 'post':
        var post = settings.arguments as Post;
        return MaterialPageRoute(builder: (_) => PostView(post: post,));
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(child: Text('No Route defined for ${settings.name}'),),
          );
        });
    }
  }
}