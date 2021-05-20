
import 'package:doctor/exporter.dart';
import 'package:doctor/data_models/notification.dart' as my;

class Alert extends StatefulWidget {
  @override
  _AlertState createState() => _AlertState();
}

class _AlertState extends State<Alert> {
  

  bool listViewPressed = false;

  void liftStateUp()
  {
    setState(() {
      listViewPressed ? listViewPressed=false : listViewPressed=true;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Transform.translate(
        offset: /*pressed ? Offset(-70,0) :*/ Offset(0,0) ,
        child: ListView.builder(
          itemCount: context.read<my.NotificationModel>().getCount ,
          itemBuilder: ( context , i )
          {
            my.Notification notification =  context.watch<my.NotificationModel>().getNotification( i );

            return _MyCard( notification , liftStateUp , listViewPressed );

          } ,
        ),
    );

  }
}

class _MyCard extends StatelessWidget {
  
  my.Notification notification;
  Function liftStateUp;
  bool listViewPressed;
  _MyCard( this.notification , this.liftStateUp , this.listViewPressed );


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

          TextButton(
            onPressed: (){
              
            },
            onLongPress: (){
              liftStateUp();
              if ( !listViewPressed )
              {
                Scaffold.of(context).showBottomSheet( (context){
                  return Container(
                    height: 80,
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
                            liftStateUp();
                            Navigator.pop(context);
                          },
                        ),
                      ]
                    ),
                  );
                });
              }

            },
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(Colors.white),
            ),
            child: Card(
              elevation: 1,
              //color: Colors.pink,
              child: Container(
                width: listViewPressed ? MediaQuery.of(context).size.width-24-60 : MediaQuery.of(context).size.width-24,
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

        _MyCheckBox( listViewPressed )
        
      ]
    );
  }
}

class _MyCheckBox extends StatefulWidget {

  final bool listViewPressed;
  const _MyCheckBox(this.listViewPressed);
  @override
  __MyCheckBoxState createState() => __MyCheckBoxState();
}

class __MyCheckBoxState extends State<_MyCheckBox> {

  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.listViewPressed ? 50 : 0,
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