import 'package:auto_pub/locator.dart';
import 'package:auto_pub/ui/router.dart';
import 'package:flutter/material.dart';

import 'ui/views/login_view.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      onGenerateRoute: Router.generateRoute,
          title: 'Flutter Demo',
          theme: ThemeData(),
          home: LoginView(),
        );
  }
}
