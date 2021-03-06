import 'package:flutter/foundation.dart';

class ScrollEventNotifier extends ChangeNotifier {
  ScrollEventNotifier(this._isScrolling, this._isReverseScrolling);
  bool _isScrolling = false;
  bool _isReverseScrolling = false;

  
  bool get isScrolling => _isScrolling;

  set isScrolling(bool scroll){
    _isScrolling = scroll;
    notifyListeners();
  }

  bool get isReverseScrolling => _isReverseScrolling;

  set isReverseScrolling(bool scroll){
    _isReverseScrolling = scroll;
    notifyListeners();
  }
}