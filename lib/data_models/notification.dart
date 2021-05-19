
import 'package:doctor/exporter.dart';


class Notification
{
  final Icon icon;
  final image;
  final String title , description;
  final date;

  const Notification ({
    this.icon,
    this.image,
    this.title,
    this.description,
    this.date,
  });
}

class NotificationModel extends ChangeNotifier
{

  int get getCount => _notifications.length;
  
  Notification getNotification( int i ) => _notifications[i];


  void addNotification( Icon icon,dynamic image,String title,String description,dynamic date  )
  {
    _notifications.add(
        Notification(
          icon: icon,
          image: image,
          title: title,
          description: description,
          date: date
        )
    );
    notifyListeners();
  }
  void removeNotification( Notification object )
  {
    _notifications.remove( object );
    notifyListeners();
  }



  List<Notification> _notifications = [

    Notification(
      icon: Icon(Icons.check_box),
      image: AssetImage('assets/5.jpg'),
      title: 'Flutter Team',
      description: 'Your appointment with dr. Lena Swan have been Cancelled',
      date: '15 jun'
    ),


    Notification(
      icon: Icon(Icons.ac_unit),
      image: AssetImage('assets/2.jpg'),
      title: 'Flutter Team',
      description: 'Your appointment with dr. sherif have been Confirmed',
      date: '23 may'
    ),


    Notification(
      icon: Icon(Icons.zoom_out),
      image: AssetImage('assets/2.jpg'),
      title: 'dr. sherif',
      description: 'dr. sherif Added new certificates to his acount',
      date: '7 jan'
    ),


    Notification(
      icon: Icon(Icons.golf_course),
      image: AssetImage('assets/2.jpg'),
      title: 'dr. mohammed',
      description: 'dr. mohammed have got his Phd in medicine',
      date: '01 july'
    ),


    Notification(
      icon: Icon(Icons.youtube_searched_for_outlined),
      image: AssetImage('assets/2.jpg'),
      title: 'Lena Swan',
      description: 'it has been a greeat day',
      date: '15 jun'
    ),


    Notification(
      icon: Icon(Icons.accessibility_sharp),
      image: AssetImage('assets/2.jpg'),
      title: 'Lena Swan',
      description: 'it has been a greeat day',
      date: '15 jun'
    ),


    Notification(
      icon: Icon(Icons.adb),
      image: AssetImage('assets/2.jpg'),
      title: 'Lena Swan',
      description: 'it has been a greeat day',
      date: '15 jun'
    ),


    Notification(
      icon: Icon(Icons.android),
      image: AssetImage('assets/2.jpg'),
      title: 'Lena Swan',
      description: 'it has been a greeat day',
      date: '15 jun'
    ),


    Notification(
      icon: Icon(Icons.check_box),
      image: AssetImage('assets/2.jpg'),
      title: 'Lena Swan',
      description: 'it has been a greeat day',
      date: '15 jun'
    ),


    Notification(
      icon: Icon(Icons.check_box),
      image: AssetImage('assets/2.jpg'),
      title: 'Lena Swan',
      description: 'it has been a greeat day',
      date: '15 jun'
    ),


    Notification(
      icon: Icon(Icons.check_box),
      image: AssetImage('assets/2.jpg'),
      title: 'Lena Swan',
      description: 'it has been a greeat day',
      date: '15 jun'
    ),
  ];

}
