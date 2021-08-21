
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'exporter.dart';
import 'package:doctor/models/bottomAppBar.dart' as my;
import 'package:doctor/models/appBar.dart' as my;


class PRE extends StatelessWidget {
  Widget widget;
  PRE(this.widget);
  final String userId = FirebaseAuth.instance.currentUser.uid;

  @override
  Widget build(BuildContext contextPRE) {
    
    return Scaffold(

        bottomNavigationBar: TRY2() ,

        appBar: AppBar(
          elevation: 20,
          title:Text('Profile'),
          /*leading: contextPRE.watch<my.AppBarModel>().getLeading ??
              IconButton(
                onPressed: (){
                  contextPRE.read<my.BottomAppBar>().setSelected( 0 );
                  Navigator.pop(contextPRE);
                },
                icon:Icon(Icons.menu),
              ),
          */
          actions: <Widget>[Container(margin: EdgeInsets.only(right: 10) ,child: Icon(Icons.search,size: 30,))],
          centerTitle: true,
        ),

        drawer: SizedBox(
          width: MediaQuery.of(contextPRE).size.width * .7,
          child: MyDrawer(
            FirebaseFirestore.instance.collection('users/').doc(userId).get()
          ),
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


class MyDrawer extends StatelessWidget {

  final Future<DocumentSnapshot<Map<String,dynamic>>> doc;
  int selected;
  int counter;
  MyDrawer(this.doc);
  //final String s = ModalRoute.of(context).settings.name;

  void getSelectedRoute(BuildContext ctx)
  {
    counter=-1;
    switch ( ModalRoute.of(ctx).settings.name )
    {
      case '/home':
        selected = 0;
        break;
      case '/saved':
        selected=1;
        break;
      case '/alert':
        selected=2;
        break;
      case '/more':
        selected=3;
        break;
      default:
        selected=0;
    }
  }

  Widget myListTile(IconData iconData,String text,Function function)
  {
    counter++;
    return Card(
      shadowColor: Colors.transparent,
      child: ListTile(
        leading: Icon(iconData),
        title:Text(text),
        onTap: function,
        selected: selected == counter,
        //selectedTileColor: Colors.purple,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    getSelectedRoute(context);
    return FutureBuilder(
      future: doc,
      builder: (ctx,AsyncSnapshot<DocumentSnapshot<Map<String,dynamic>>> snapshot) => snapshot.connectionState != ConnectionState.done
      ? CircularProgressIndicator()
      : Drawer(
          child: Container(
            color:Colors.white,
            child: ListView(
              padding: EdgeInsets.zero,
              children: [

                DrawerHeader(
                  margin: EdgeInsets.zero,
                  padding: EdgeInsets.zero,
                  decoration: BoxDecoration(
                    color:Colors.blue,
                  ),
                  child: Stack(children: [
                    Positioned(
                      top:12,
                      left: 20,
                      child: InkWell(
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(snapshot.data.data()['ProfilePictureURL']),
                          radius: 38,
                        ),
                        onTap: () => showModalBottomSheet(context: context,isScrollControlled: true ,builder: (_) => Container(
                                      width: MediaQuery.of(_).size.width,
                                      height: MediaQuery.of(_).size.height-50,
                                      color: Colors.black,
                                      child: Stack(children:[
                                          Center(child: Image.network(snapshot.data.data()['ProfilePictureURL'])),  
                                          Align(
                                            alignment: Alignment.topRight,
                                            child: Padding(
                                              padding: const EdgeInsets.only(top: 35,right: 15),
                                              child: IconButton(
                                                onPressed: ()=> Navigator.of(_).pop(),
                                                icon: Icon(Icons.close,color: Colors.white,),
                                                //color:Colors.purple,
                                                iconSize: 50,
                                              ),
                                            ),
                                          )]
                                      ),
                                    )),
                      ),
                    ),
                    Positioned(
                      bottom: 35,
                      left: 20,
                      child: Text(snapshot.data.data()['name'] ,style:TextStyle(fontWeight:FontWeight.bold,fontSize:30),),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 20,
                      child: Text(snapshot.data.data()['email'],style:TextStyle(color:Colors.grey,fontSize:18),)
                    ),
                  ]),
                ),

                Divider(),

                myListTile(Icons.home,      'Home',()=> Navigator.pushNamed(context, Constants.homeScreen)),
                myListTile(Icons.download,  'Saved',()=> Navigator.pushNamed(context, Constants.savedScreen)),
                myListTile(Icons.add_alert, 'Alert',()=> Navigator.pushNamed(context, Constants.alertScreen)),
                myListTile(Icons.menu,      'More',()=> Navigator.pushNamed(context, Constants.moreScreen)),
                Divider(),
                Padding(
                  padding: EdgeInsets.only(left:20,top:10,bottom:10),
                  child: Text('Profile',style:TextStyle(fontSize:16,color:Colors.grey)),
                ),
                myListTile(Icons.settings, 'Settings',()=> Navigator.pushNamed(context, Constants.moreScreen)),

                myListTile(Icons.exit_to_app,'Log Out',(){
                    FirebaseAuth.instance.signOut().then((value) =>
                    Navigator.pushReplacementNamed(context, Constants.authScreen));
                }),


              ],
            ),
          ),
        ),
    );
  
  }


}