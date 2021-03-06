


import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'exporter.dart';
import 'package:doctor/models/notification.dart' as my;
import 'package:doctor/models/bottomAppBar.dart' as my;
import 'package:doctor/models/appBar.dart' as my;
import 'screens/authentication.dart';



  main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    runApp(MyApp());
  }


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
          initialRoute: FirebaseAuth.instance.currentUser == null ? Constants.authScreen: Constants.homeScreen,

          routes: {
            
            Constants.homeScreen  : (_) => PRE( Home() ),
            Constants.authScreen  : (_) => Authentication(),
            Constants.savedScreen : (_) => PRE(Saved() ),
            Constants.addScreen   : (_) => Add(),
            Constants.alertScreen : (_) => PRE( Alert() ),
            Constants.moreScreen  : (_) => More(),

          },
      ),

    );
  }
}
