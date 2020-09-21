import 'package:auto_pub/core/enums/view_state.dart';
import 'package:auto_pub/core/services/auth/auth_service.dart';
import 'package:auto_pub/core/viewmodels/base_viewmodel.dart';
import 'package:auto_pub/locator.dart';


class LoginViewModel extends BaseViewModel {
  final AuthenticationService _authenticationService = locator<AuthenticationService>();

  String errorMessage;

  Future<bool> login(String userIdText) async {
    setState(ViewState.Busy);

    var userId = int.tryParse(userIdText);
    if(userId == null) {
      errorMessage = 'value entered is not a number';
      setState(ViewState.Idle);
      return false;
    }

    var success = await _authenticationService.login(userId);

    setState(ViewState.Idle);
    return success;
  }

}