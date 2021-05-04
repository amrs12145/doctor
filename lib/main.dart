import 'exporter.dart';

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

        ],

      child: 
        MaterialApp(
          title: 'Doctor',
          //home: PRE(Screen2()),
          debugShowCheckedModeBanner: false,
          initialRoute: 'home',

          routes: {
            'home':   (home) => PRE(Home()),
            'saved': (saved) => Saved(),
            'add':   (add) => Add(),
            'alert': (alert) => Alert(),
            'more':  (saved) => More(),

          },
      ),

    );
  }
}
