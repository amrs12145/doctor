
import 'package:flutter/foundation.dart';


class BottomAppBar extends ChangeNotifier
{
  bool isClosed = false;
  
  void close()
  {
    isClosed = true;
    notifyListeners();
  }
  void open()
  {
    isClosed = false;
    notifyListeners();
  }
}
