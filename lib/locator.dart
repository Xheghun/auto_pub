import 'package:auto_pub/core/services/api.dart';
import 'package:auto_pub/core/services/auth/auth_service.dart';
import 'package:auto_pub/core/viewmodels/home_viewmodel.dart';
import 'package:auto_pub/core/viewmodels/login_viewmodel.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  //services
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => Api());

  //viewmodels
  locator.registerLazySingleton(() => LoginViewModel());
  locator.registerFactory(() => HomeViewModel());

}