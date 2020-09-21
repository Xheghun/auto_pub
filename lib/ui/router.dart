import 'package:auto_pub/ui/views/home_view.dart';
import 'package:auto_pub/ui/views/login_view.dart';
import 'package:auto_pub/ui/views/post_view.dart';
import 'package:flutter/material.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeView());
      case 'login':
        return MaterialPageRoute(builder: (_) => LoginView());
      case 'post':
        return MaterialPageRoute(builder: (_) => PostView());
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(child: Text('No Route defined for ${settings.name}'),),
          );
        });
    }
  }
}