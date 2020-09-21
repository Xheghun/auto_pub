import 'package:auto_pub/locator.dart';

import '../api.dart';

class AuthenticationService {
  //inject api
  Api _api = locator<Api>();

  Future<bool> login(int userId) async {
    //get the user profile for id
    var fetchedUser = await _api.getUserProfile(userId);

    //check if success
    var hasUser = fetchedUser != null;

    return hasUser;
  }
}