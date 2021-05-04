
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
        ),

        body: widget,
    );
  }
}


class TRY2 extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return
    Container(
      height: 75,
      child:BottomAppBar(
        
          child:Row(

              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                MyFun(Icons.home, 'Home', 0 , fun: (){ Navigator.pushNamed(context, 'home');} ),
                MyFun(Icons.save_alt, 'Saved', 1 /*, fun: (){ Navigator.pushNamed(context, 'home');}*/ ),
                Container(child:FloatingActionButton(onPressed: (){Navigator.pushNamed(context, 'add');},child:Icon(Icons.add,color: Colors.white,),elevation: 50,) ,),
                MyFun(Icons.add_alert, 'Alert' , 2 , fun: (){ Navigator.pushNamed(context, 'alert');} ),
                MyFun(Icons.menu, 'More', 3 , fun: (){Navigator.pushNamed(context, 'more');} ),

          ],),
      ),
    );
  }


}


class MyFun extends StatelessWidget
{
  IconData iconData;
  String text;
  int index;
  static int indexx = 0;
  Function fun;

  MyFun(this.iconData,this.text,this.index,{ this.fun })
  {
    if ( MyFun.indexx == 4 )
    {
      MyFun.indexx =0;
    }

    index = MyFun.indexx;
    MyFun.indexx++;
  }

  /*  @override
  Widget build(BuildContext context)
  {
    return Text( text );
  }*/

  @override
  Widget build(BuildContext context)
  {
    //context.read<AppBarModel>().setText( this.text , this);
    return
      Container(
        width: 80,
        child:FlatButton(
          //padding: EdgeInsets.all(0),
          onPressed: (){
            //fun!=null? fun() : text='Failed to call'/*Not Gonna work cuz reCalling build*/ ;
            fun!=null? fun() : context.read<AppBarModel>().setText( 'Failed' , this ) ;
            //sel =  this.myFun ;
            //setState(
              //(){
                //selected=index;
                context.read<AppBarModel>().setSelected( index );
                print(index);
                //context.read<AppBarModel>().setCurrentActive( this );
              //});

          },
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(iconData,
                color: context.watch<AppBarModel>().getSelected == index ?                             Colors.blue:Colors.grey,),

              Text( context.watch<AppBarModel>().getText( this ) ,style: TextStyle( color: context.watch<AppBarModel>().isActive( this ) ?     Colors.blue:Colors.grey),)
            ],
          ),
        )
      );
  }

}



/*                                    FAAAAAAAAAAAAAAAAAAIIIIIIIIIILDDDDDDDDDDDddd
*/