import 'exporter.dart';

main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => PeopleModel() ,

        )],

      child: 
        MaterialApp(
          title: 'Doctor',
          //home: PRE(Screen2()),
          debugShowCheckedModeBanner: false,
          initialRoute: 'home',

          routes: {
            'home': (home) => PRE(Home()),
            //'screen1': (screen2)=> PRE(Screen1()),
            'more': (saved) => More(),
            'add': (add) => Add(),
          },
      ),

    );
  }
}
