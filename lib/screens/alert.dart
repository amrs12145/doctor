
import 'package:doctor/exporter.dart';
import 'package:doctor/data_models/notification.dart' as my;
import 'package:doctor/data_models/bottomAppBar.dart' as my;
import 'package:doctor/data_models/alert_press.dart';

class Alert extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
        offset: /*pressed ? Offset(-70,0) :*/ Offset(0,0) ,
        child: ListView.builder(
          itemCount: context.read<my.NotificationModel>().getCount ,
          itemBuilder: ( context , i )
          {
            my.Notification notification =  context.watch<my.NotificationModel>().getNotification( i );

            return _MyCard( notification );

          } ,
        ),
    );

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
              {print('1');
                context.read<my.BottomAppBar>().close();
                Future.delayed(Duration(milliseconds: 500)).then( (value) => context.read<Alert_Press>().open() );
                Future.delayed(Duration(milliseconds: 1001)).then( (value) => context.read<Alert_Press>().toggle() );
              }
              else if ( context.read<Alert_Press>().tmp++ !=1 )
              {print('2');
                context.read<Alert_Press>().close();
                Future.delayed(Duration(milliseconds: 500)).then( (value) => context.read<my.BottomAppBar>().open() ); 
                Future.delayed(Duration(milliseconds: 1001)).then( (value)=> context.read<Alert_Press>().toggle() );
              }



            },
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(Colors.white),
            ),
            child: Card(
              elevation: 1,
              //color: Colors.pink,
              child: Container(
                width:  context.watch<Alert_Press>().isListViewPressed ?
                          MediaQuery.of(context).size.width-24-60 : MediaQuery.of(context).size.width-24,
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

        _MyCheckBox()
        
      ]
    );
  }
}

class _MyCheckBox extends StatefulWidget {

  const _MyCheckBox();
  @override
  __MyCheckBoxState createState() => __MyCheckBoxState();
}

class __MyCheckBoxState extends State<_MyCheckBox> {

  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.watch<Alert_Press>().isListViewPressed ? 50 : 0,
      child: IconButton(
        icon: pressed ? Icon( Icons.check_box,color:Colors.blueAccent  ) : Icon( Icons.check_box_outline_blank  ),
        //color:Colors.blueAccent,
        onPressed: (){
          print( pressed );
          setState((){
            pressed ? pressed = false : pressed = true;
          });
          print( pressed );
        },
      ),
    );
  }
}