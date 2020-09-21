import 'package:auto_pub/core/services/auth/auth_service.dart';
import 'package:auto_pub/locator.dart';
import 'package:flutter/foundation.dart';

enum ViewState{Idle,Busy}

class LoginViewModel extends ChangeNotifier {
  final AuthenticationService _authenticationService = locator<AuthenticationService>();

  ViewState _state = ViewState.Idle;

  ViewState get state => _state;

  void setState(ViewState value) {
    _state = value;
    notifyListeners();
  }

  Future<bool> login(String userIdText) async {
    setState(ViewState.Busy);
    var userId = int.tryParse(userIdText);
    var success = await _authenticationService.login(userId);

    setState(ViewState.Idle);
    return success;
  }

}