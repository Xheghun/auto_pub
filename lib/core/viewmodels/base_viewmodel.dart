import 'package:auto_pub/core/enums/view_state.dart';
import 'package:flutter/foundation.dart';

//represent state of the view
class BaseViewModel extends ChangeNotifier {
  ViewState _state = ViewState.Idle;

  ViewState get state => _state;

  void setState(ViewState value) {
    _state = value;
    notifyListeners();
  }
}