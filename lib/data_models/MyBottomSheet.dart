
import 'package:flutter/foundation.dart';


class MyBottomSheet extends ChangeNotifier
{
  int count = 0 ;
  bool _isClosed = true;

  bool isClosed() => _isClosed;
  
  open()
  {
    _isClosed = false;
    notifyListeners();
  }
  close()
  {
    _isClosed = true;
    notifyListeners();
  }
}