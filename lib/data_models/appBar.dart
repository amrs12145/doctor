

import 'package:doctor/exporter.dart';


class AppBarModel extends ChangeNotifier
{
  int selected;
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