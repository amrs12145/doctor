

import 'package:flutter/foundation.dart';

import '../pre.dart';





class BottomAppBar extends ChangeNotifier
{

  /* *********** TO CONTROL ANIMATIONS  *********/
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
  /* **************************************/




  /* ************* to control statemangemnt between TABs ***********/
  int selected = 0;
  MyFun active;
  

  void setSelected ( int i )
  {
    this.selected = i;
    notifyListeners();
  }
  void setText ( String s , MyFun o )
  {
    o.text = s;
    notifyListeners();
  }

  void setCurrentActive ( MyFun o )
  {
    active = o;
    notifyListeners();
  }
  
  int get getSelected => this.selected!=null ? this.selected : -1 ;
  String getText ( MyFun o ) => o.text;



  bool isActive ( MyFun o )
  {
    if ( active == o  )
      return true;
    else
      return false;
  }



}