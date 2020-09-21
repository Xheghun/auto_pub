import 'dart:async';
import 'package:auto_pub/core/data_models/user.dart';
import 'package:auto_pub/locator.dart';

import '../api.dart';

class AuthenticationService {
  //inject api
  Api _api = locator<Api>();
  StreamController<User> userController = StreamController<User>();
  Future<bool> login(int userId) async {
    //get the user profile for id
    User fetchedUser = await _api.getUserProfile(userId);
    //check if success
    var hasUser = fetchedUser != null;
    if(hasUser) {
      userController.add(fetchedUser);
    }
    return hasUser;
  }
}