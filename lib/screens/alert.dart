
import 'package:doctor/exporter.dart';
import 'package:doctor/data_models/notification.dart' as my;

class Alert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      itemCount: context.read<my.NotificationModel>().getCount ,
      itemBuilder: ( context , i )
      {
        my.Notification notification =  context.watch<my.NotificationModel>().getNotification( i );
        return Transform.translate(
          offset: Offset(00,0),
          child: TextButton(
              onPressed: (){

              },
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(Colors.white),
              ),
              child: Card(
                elevation: 1,
                //color: Colors.pink,
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
        );
      } ,
    );

  }
}