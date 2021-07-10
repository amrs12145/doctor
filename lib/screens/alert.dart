
import 'package:doctor/exporter.dart';
import 'package:doctor/data_models/notification.dart' as my;
import 'package:doctor/data_models/bottomAppBar.dart' as my;
import 'package:doctor/data_models/appBar.dart' as my;
import 'package:doctor/data_models/myBottomSheet.dart';

class Alert extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
        offset: /*pressed ? Offset(-70,0) :*/ Offset(0,0) ,
        child: ListView.builder(
          itemCount: context.watch<my.NotificationModel>().getCount ,
          itemBuilder: ( context , i )
          {
            my.Notification notification =  context.watch<my.NotificationModel>().getNotification( i );

            return Container(child: _MyCard( notification ));

          } ,
        ),
    );

  }
}

/*
void try1(BuildContext context)
{
  if ( context.read<Alert_Press>().tmp == 0 )
  {
    
      context.read<Alert_Press>().tmp++;
      context.read<my.BottomAppBar>().close();
      Future.delayed(Duration(milliseconds: 500)).then((value) => context.read<Alert_Press>().open() );
      
        Scaffold.of(context).showBottomSheet( (context){

          return AnimatedContainer(
            duration: Duration(milliseconds: 500),
            height: context.watch<Alert_Press>().isListViewPressed ? 75 : 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround ,
              children:[
                TextButton(
                  child:Text('Confirm'),
                  onPressed: (){
                  },
                ),
                TextButton(
                  child:Text('Cancel'),
                  onPressed: (){
                    //liftStateUp();
                    Navigator.pop(context);
                  },
                ),
              ]
            ),
          );

        });



  }
  else
  {
    context.read<Alert_Press>().tmp++;
  }


  if ( context.read<Alert_Press>().isListViewPressed  )
  { print('isListViewPressed = true');
    context.read<my.BottomAppBar>().close();
    Future.delayed(Duration(milliseconds: 500)).then( (value) => context.read<Alert_Press>().open() );
    Future.delayed(Duration(milliseconds: 1001)).then( (value) => context.read<Alert_Press>().toggle() );
  }
  else if ( context.read<Alert_Press>().tmp++ !=1 )
  { print('isListViewPressed = false');
    context.read<Alert_Press>().close();
    Future.delayed(Duration(milliseconds: 500)).then( (value) => context.read<my.BottomAppBar>().open() ); 
    Future.delayed(Duration(milliseconds: 1001)).then( (value)=> context.read<Alert_Press>().toggle() );
  }

}
*/




void try2(BuildContext context)
{


    if ( context.read<MyBottomSheet>().isClosed() )
    {
      context.read<my.BottomAppBar>().close();
      Future.delayed(Duration(milliseconds: 500)).then( (value) => context.read<MyBottomSheet>().open() );

      context.read<my.AppBarModel>().setLeading = IconButton( onPressed: () => 
                    context.read<my.NotificationModel>().isAllchecked ? context.read<my.NotificationModel>().unCheckAllNotifications() : context.read<my.NotificationModel>().checkAllNotifications(),

            icon:Builder(builder:(c) => Icon( c.watch<my.NotificationModel>().isAllchecked ? Icons.tab_unselected_outlined : Icons.select_all_outlined)),
      );

    }
    else
    {
      context.read<MyBottomSheet>().close();
      Future.delayed(Duration(milliseconds: 500)).then( (value) => context.read<my.BottomAppBar>().open() );
      context.read<my.AppBarModel>().setLeading = Icon(Icons.arrow_back_ios);
    }

//        //TODO: temporarily WORKAROUND
      if ( context.read<MyBottomSheet>().count ==0 )
      { context.read<MyBottomSheet>().count ++;

        Scaffold.of(context).showBottomSheet( (context){

          return WillPopScope(

            onWillPop: () async {
              
              if ( !context.read<MyBottomSheet>().isClosed() )
               context.read<my.NotificationModel>().unCheckAllNotifications();

              return false;

            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 500),
              height: context.watch<MyBottomSheet>().isClosed() ? 0 : 75,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround ,
                children:[
                  TextButton(
                    child:Text('DELETE'),
                    onPressed: (){
                      context.read<my.NotificationModel>().deleteCheckedNotifications();
                    },
                  ),
                  TextButton(
                    child:Text('CANCEL'),
                    onPressed: (){
                      context.read<my.NotificationModel>().unCheckAllNotifications();
                      try2(context);
                    },
                  ),
                ]
              ),
            ),
          );

        });
      }
            
}




class _MyCard extends StatelessWidget {
  
  my.Notification notification;

  _MyCard( this.notification );
  

  @override
  Widget build(BuildContext context) {

    return Row(
      children: [

          TextButton(
            onPressed: (){
              
            },
            onLongPress: (){

              //try1(context);
              try2(context);
              //TODO: a class
            },
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(Colors.white),
            ),
            child: Card(
              elevation: 1,
              //color: Colors.pink,
              child: AnimatedContainer(
                duration: Duration(milliseconds:500),
                width:  /*context.watch<Alert_Press>().isListViewPressed ?
                          MediaQuery.of(context).size.width-24-60 : MediaQuery.of(context).size.width-24*/ 
                          context.watch<MyBottomSheet>().isClosed() ? MediaQuery.of(context).size.width-24 : MediaQuery.of(context).size.width-24-60,

                height: 90,
                child: ListTile(
                  leading:
                    Stack(
                      children: [
                        Container(
                          child: Image(
                            image : notification.image,
                          ),
                          margin: EdgeInsets.only(left: 10) ,
                        ),
                        notification.icon,

                        
                      ],
                    
                  ),
                  title: Container(margin:EdgeInsets.only(top: 8 ),child: Text( notification.title, style: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.bold), )),
                  subtitle: Container(margin:EdgeInsets.only(top:8,bottom: 8 ),child: Text( notification.description , style: TextStyle(color: Colors.black54,letterSpacing: 1.1  ),)),
                  trailing: Text( notification.date,style: TextStyle(color:Colors.black45,fontSize:12), ),
                  isThreeLine: false,
                ),
              ),
          ),
        ),

        MyCheckBox(notification)
        
      ]
    );
  }
}

class MyCheckBox extends StatelessWidget {

  my.Notification notification;
  MyCheckBox(this.notification);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
            duration: Duration(milliseconds:500),
      width: /*context.watch<Alert_Press>().isListViewPressed ? 50 : 0*/
                context.watch<MyBottomSheet>().isClosed() ? 0 : 50,
      child: IconButton(
        icon: context.watch<my.NotificationModel>().isNotificationChecked(object: notification) ? Icon( Icons.check_box,color:Colors.blueAccent  ) : Icon( Icons.check_box_outline_blank  ),
        //color:Colors.blueAccent,
        onPressed: (){
            //pressed ? pressed = false : pressed = true;
            context.read<my.NotificationModel>().isNotificationChecked(object: notification) ?
                context.read<my.NotificationModel>().unCheckNotification(object: notification) : context.read<my.NotificationModel>().checkNotification(object: notification);

        },
      ),
    );
  }
}