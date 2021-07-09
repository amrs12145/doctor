
import 'package:flutter/foundation.dart';


class BottomAppBar extends ChangeNotifier
{
  bool _isClosed = false;
  
  bool isClosed()
  {
    return _isClosed;
  }
  void close()
  {
    _isClosed = true;
    notifyListeners();
  }
  void open()
  {
    _isClosed = false;
    notifyListeners();
  }
}
