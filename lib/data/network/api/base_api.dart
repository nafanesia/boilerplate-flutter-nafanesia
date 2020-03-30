import 'package:boilerplate_flutter_nafanesia/enums/view_state.dart';
import 'package:flutter/foundation.dart';

class BaseApi extends ChangeNotifier {
  ViewState _state = ViewState.IDLE;

  ViewState get state => _state;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }
}
