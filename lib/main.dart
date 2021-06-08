
import 'exporter.dart';
import 'package:doctor/data_models/notification.dart' as my;


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
          create: (context) => AppBarModel(),
        ),

        ChangeNotifierProvider(
          create: (context) => my.NotificationModel(),
        )


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
