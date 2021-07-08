
import 'package:flutter/foundation.dart';


class Alert_Press extends ChangeNotifier
{
  bool isListViewPressed = false;
  int tmp = 0;
  int getTemp() => tmp;
  
  toggle()
  {
    isListViewPressed = isListViewPressed ? false : true;
  }
  open()
  {
    isListViewPressed = true;
    notifyListeners();
  }
  close()
  {
    isListViewPressed = false;
    notifyListeners();
  }
  
}