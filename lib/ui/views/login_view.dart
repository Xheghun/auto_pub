import 'package:auto_pub/core/enums/view_state.dart';
import 'package:auto_pub/core/viewmodels/login_viewmodel.dart';
import 'package:auto_pub/ui/shared/app_colors.dart';
import 'package:auto_pub/ui/views/base_view.dart';
import 'package:auto_pub/ui/widgets/login_header.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {

  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
      builder: (context,model,child) => Scaffold(
        backgroundColor: backgroundColor,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LoginHeader(controller: controller,validationMessage: model.errorMessage,),
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
    );
  }
}
