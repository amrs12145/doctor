
import 'package:doctor/exporter.dart';
import 'package:flutter/foundation.dart';

class AppBarModel extends ChangeNotifier
{
  
  Widget text;
  Widget leading;
  List<Widget> listOfActions;



  set setText(Widget text)
  {
    this.text = text;
    notifyListeners();
  }

  Widget get getText => this.text;


  set setLeading(Widget leading)
  {
    this.leading = leading;
    notifyListeners();
  }

  Widget get getLeading => this.leading;


  set setActions(List<Widget> listOfActions)
  {
    this.listOfActions = listOfActions;
    notifyListeners();
  }

  List<Widget> get getActions => this.listOfActions;
}