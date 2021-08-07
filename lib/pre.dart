
import 'exporter.dart';
import 'package:doctor/models/bottomAppBar.dart' as my;
import 'package:doctor/models/appBar.dart' as my;


class PRE extends StatelessWidget {
  Widget widget;
  PRE(this.widget);
  @override
  Widget build(BuildContext contextPRE) {
    return Scaffold(

        bottomNavigationBar: TRY2() ,

        appBar: AppBar(
          elevation: 20,
          title:Text('Profile'),
          leading: contextPRE.watch<my.AppBarModel>().getLeading ??
              IconButton(
                onPressed: (){
                  contextPRE.read<my.BottomAppBar>().setSelected( 0 );
                  Navigator.pop(contextPRE);
                },
                icon:Icon(Icons.menu),
              ),
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
    AnimatedOpacity(
      duration: Duration(milliseconds: 500),
      opacity: context.watch<my.BottomAppBar>().isClosed() ?  0 : 1,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        height: context.watch<my.BottomAppBar>().isClosed() ? 0 : 75 ,
        child:BottomAppBar(
          
            child:Row(

                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  MyFun(Icons.home, 'Home', 0 ,              fun: ()=> Navigator.pushNamed(context, Constants.homeScreen ) ),
                  MyFun(Icons.save_alt, 'Saved', 1 ,         fun: ()=> Navigator.pushNamed(context, Constants.savedScreen ) ),
                  Container(child:FloatingActionButton(onPressed: ()=> Navigator.pushNamed(context, Constants.addScreen ),child:Icon(Icons.add,color: Colors.white,),elevation: 50,) ,),
                  MyFun(Icons.add_alert, 'Alert' , 2 ,       fun: ()=> Navigator.pushNamed(context, Constants.alertScreen ) ),
                  MyFun(Icons.menu, 'More', 3 ,              fun: ()=> Navigator.pushNamed(context, Constants.moreScreen ) ),

            ],),
        ),
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
            fun!=null? fun() : context.read<my.BottomAppBar>().setText( 'Failed' , this ) ;
            //sel =  this.myFun ;
            //setState(
              //(){
                //selected=index;
                context.read<my.BottomAppBar>().setSelected( index );
                print(index);
                //context.read<AppBarModel>().setCurrentActive( this );
              //});

          },
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(iconData,
                color: context.watch<my.BottomAppBar>().getSelected == index ?                             Colors.blue:Colors.grey,),

              Text( context.watch<my.BottomAppBar>().getText( this ) ,style: TextStyle( color: context.watch<my.BottomAppBar>().isActive( this ) ?     Colors.blue:Colors.grey),)
            ],
          ),
        )
      );
  }

}



/*                                    FAAAAAAAAAAAAAAAAAAIIIIIIIIIILDDDDDDDDDDDddd
*/