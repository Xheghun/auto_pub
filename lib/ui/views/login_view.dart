import 'package:auto_pub/core/viewmodels/login_viewmodel.dart';
import 'package:auto_pub/locator.dart';
import 'package:auto_pub/ui/shared/app_colors.dart';
import 'package:auto_pub/ui/widgets/login_header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  final TextEditingController controller = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginViewModel>(
      create: (context) => locator<LoginViewModel>(),
      child: Consumer<LoginViewModel>(
        builder: (context,model,child) => Scaffold(
          backgroundColor: backgroundColor,
          body: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LoginHeader(controller: controller,),
              model.state == ViewState.Busy ? CircularProgressIndicator(
              ):
              FlatButton(
                color: Colors.white,
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () async {
                  var loginSuccess = await model.login(controller.text);
                  if(loginSuccess) {
                    //navigate home
                    Navigator.pushNamed(context, '/');
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
