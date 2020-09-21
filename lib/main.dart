import 'package:auto_pub/core/services/auth/auth_service.dart';
import 'package:auto_pub/locator.dart';
import 'package:auto_pub/ui/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/data_models/user.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  StreamProvider<User>(
      initialData: User.initial(),
      create: (context) => locator<AuthenticationService>().userController.stream,
      child: MaterialApp(
        onGenerateRoute: Router.generateRoute,
        title: 'Flutter Demo',
        theme: ThemeData(),
        initialRoute: 'login',
      ),
    );
  }
}