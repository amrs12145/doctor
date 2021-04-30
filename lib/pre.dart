import 'exporter.dart';

class PRE extends StatelessWidget {
  Widget widget;
  PRE(this.widget);
  @override
  Widget build(BuildContext contextPRE) {
    return Scaffold(
        bottomNavigationBar: TRY2(),
        appBar: AppBar(
          elevation: 20,
          title:Text('Profile'),
          leading: IconButton(onPressed: (){Navigator.pop(contextPRE);}
            ,icon:Icon(Icons.more_vert), ),
          actions: <Widget>[Container(margin: EdgeInsets.only(right: 10) ,child: Icon(Icons.search,size: 30,))],
          centerTitle: true,
        ) ,
        body: widget,
    );
  }
}


class TRY2 extends StatefulWidget {
  @override
  _TRY2State createState() => _TRY2State();
}

class _TRY2State extends State<TRY2> {
  int selected=0;
  @override
  Widget build(BuildContext context) {
    return
    Container(
      height: 75,
      child:BottomAppBar(
        
          child:Row(

              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                myFun(Icons.home, 'Home', 0  ),
                myFun(Icons.save_alt, 'Saved', 1 ),
                Container(child:FloatingActionButton(onPressed: (){Navigator.pushNamed(context, 'add');},child:Icon(Icons.add,color: Colors.white,),elevation: 50,) ,),
                myFun(Icons.add_alert, 'Alert' , 2),
                myFun(Icons.menu, 'More', 3 , fun: (){Navigator.pushNamed(context, 'more');} ),

          ],),
      ),
    );
  }


Container myFun(IconData iconData,String text,int index,{ Function fun })
{
  return
    Container(
      width: 80,
      child:FlatButton(
        //padding: EdgeInsets.all(0),
        onPressed: (){
          fun!=null? fun() : text='Failed to call'/*Not Gonna work cuz reCalling build*/ ;
          setState(
            (){
              selected=index;
            }
          );

        },
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(iconData,color:selected  == index?Colors.blue:Colors.grey,),
            Text(text,style: TextStyle(color:selected  == index?Colors.blue:Colors.grey),)
          ],
        ),
      ),
    );
  }

}



/*                                    FAAAAAAAAAAAAAAAAAAIIIIIIIIIILDDDDDDDDDDDddd
*/