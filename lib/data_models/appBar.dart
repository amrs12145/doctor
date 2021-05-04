

import 'package:doctor/exporter.dart';


class AppBarModel extends ChangeNotifier
{
  int selected;
  MyFun active;
  String text;
  

  void setSelected ( int i )
  {
    this.selected = i;
    notifyListeners();
  }
  void setText ( String s )
  {
    this.text =s;
    notifyListeners();
  }

  int get getSelected => this.selected!=null ? this.selected : -1 ;
  String get getText => this.text;


  void setCurrentActive ( MyFun o )
  {
    active = o;
    notifyListeners();
  }
  bool isActive ( MyFun o )
  {
    if ( active == o  )
      return true;
    else
      return false;
  }



}