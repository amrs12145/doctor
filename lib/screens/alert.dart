
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
        return ListTile(
          leading: Column(
            children: [
              notification.icon,
              Image(
                image: notification.image,
                width: 50,
              ),
            ],
          ),
          title: Text( notification.title ),
          subtitle: Text( notification.description ),
          trailing: Text( notification.date ),
          isThreeLine: true,
        );
      } ,
    );

  }
}