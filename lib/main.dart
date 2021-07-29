


import 'exporter.dart';
import 'package:doctor/data_models/notification.dart' as my;
import 'package:doctor/data_models/bottomAppBar.dart' as my;
import 'package:doctor/data_models/appBar.dart' as my;




main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [

        ChangeNotifierProvider(
          create: (context) => PeopleModel() ,
        ),

        ChangeNotifierProvider(
          create: (context) => my.BottomAppBar(),
        ),

        ChangeNotifierProvider(
          create: (context) => my.NotificationModel(),
        ),

        ChangeNotifierProvider(
          create: (context) => my.BottomAppBar(),
        ),
        ChangeNotifierProvider(
          create: (context) => Alert_Press()
        ),
        ChangeNotifierProvider(
          create: (context) => MyBottomSheet()
        ),
        ChangeNotifierProvider(
          create: (context) => my.AppBarModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => PeopleDetailsModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => PostModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => PeopleTagsModel(),
        ),



        ],

      child: 
        MaterialApp(
          title: 'Doctor',
          //home: PRE(Screen2()),
          debugShowCheckedModeBanner: false,
          initialRoute: 'home',

          routes: {
            'home':   (home) => PRE( Home() ),
            'saved': (saved) => PRE(Saved() ),
            'add':   (add) => Add(),
            'alert': (alert) => PRE( Alert() ),
            'more':  (saved) => More(),

          },
      ),

    );
  }
}
