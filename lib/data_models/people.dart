import 'package:doctor/exporter.dart';

class People {
  var image;
  int phone;
  String name, description, work, gps, home;

  People(
      {
      this.image,
      this.name,
      this.description = 'Professor at XYZ University\nMBBS,FCPC',
      this.work = 'Hospital Punla Pacifica, USA.',
      this.gps = '1736 Adams Ave, Toms River, NJ,08753',
      this.home = '1736 Adams Ave, Toms River, NJ,08753',
      this.phone});
}

class PeopleModel extends ChangeNotifier
{

  int get getLength
  {
    return _people.length;
  }

  People getPeople( int i )
  {
    return _people[i];
  }

  void addPeople( { var image , String name , String description , int phone , String home } )
  {
    _people.add(  People(
          image: image,
          name: name,
          description: description,
          phone: phone,
          home: home,
          )
      );

      notifyListeners();
  }

  void removePeople( People object )
  {
    _people.remove( object );
    notifyListeners();
  }



  People getOperations( int i )
  {
    return operations[i];
  }

List<People> operations = <People>[

    People(
      image: AssetImage('assets/math2.png'),
      name: 'differentiation',
      description: 'Y = x^2 + Cos(x)',
      phone: 950 - 251 - 254,
      work: 'Hospital Punla Pacifica, USA.',
      gps: '1736 Adams Ave, Toms River, NJ,08753',
      home: '1736 Adams Ave, Toms River, NJ,08753',
    ),

    People(
      image: AssetImage('assets/math1.png'),
      name: 'Integration',
      description: '∫ x^2 + Cos(x).dx',
      phone: 018895956654,
      work: 'at Youtube inc.',
      gps: 'Saudi-Arabia',
      home: 'Cairo,Egypt',
    ),
    People(
      image: AssetImage('assets/math3.png'),
      name: 'Vectors',
      description: '(x^2 i + xy j + xyz k).(yz i + xy j)',
      work: 'Hospital Punla Pacifica, USA.',
      phone: 0109569454,
      gps: '1736 Adams Ave, Toms River, NJ,08753',
      home: '1736 Adams Ave, Toms River, NJ,08753',
    ),
    People(
      image: AssetImage('assets/math4.jpg'),
      name: 'Gradient',
      description: 'f = xyz',
      work: 'Hospital Punla Pacifica, USA.',
      phone: 0109569454,
      gps: '1736 Adams Ave, Toms River, NJ,08753',
      home: '1736 Adams Ave, Toms River, NJ,08753',
    ),
    People(
      image: AssetImage('assets/math4.jpg'),
      name: 'Divergence',
      description: '∇.(∇∅)',
      phone: 950224545,
      work: 'Hospital Punla Pacifica, USA.',
      gps: '1736 Adams Ave, Toms River, NJ,08753',
      home: '1736 Adams Ave, Toms River, NJ,08753',
    ),
    People(
      image: AssetImage('assets/math5.png'),
      name: 'Curl',
      description: '∇^(∇∅)',
      work: 'SIM.',
      gps: '16-25 Elmammora',
      home: 'Alexandria,EGY',
    ),


    People(
      image: AssetImage('assets/math6.gif'),
      name: 'Not implemented',
      description: 'under construction....',
      work: 'SIM.',
      gps: '16-25 Elmammora',
      home: 'Alexandria,EGY',
    ),
    People(
      image: AssetImage('assets/math6.png'),
      name: 'Not implemented',
      description: 'under construction....',
      work: 'SIM.',
      gps: '16-25 Elmammora',
      home: 'Alexandria,EGY',
    ),
    People(
      image: AssetImage('assets/math6.png'),
      name: 'Not implemented',
      description: 'under construction....',
      work: 'SIM.',
      gps: '16-25 Elmammora',
      home: 'Alexandria,EGY',
    ),

  ];



  List<People> _people = <People>[
    People(
      image: AssetImage('assets/8.jpg'),
      name: 'م/ عمار الركابي',
      description: 'وصف  وصف وصصصصف',
      phone: 01286969796,
      work: 'sim.',
      gps: 'under the esclator',
      home: '45',
    ),
    People(
      image: AssetImage('assets/2.jpg'),
      name: 'DR.Alina Stlera',
      description: 'Professor at XYZ University\nMBBS,FCPC',
      phone: 950 - 251 - 254,
      work: 'Hospital Punla Pacifica, USA.',
      gps: '1736 Adams Ave, Toms River, NJ,08753',
      home: '1736 Adams Ave, Toms River, NJ,08753',
    ),
    People(
      image: AssetImage('assets/3.jpg'),
      name: 'Eng.Osama Elzero',
      description: 'Youtube Creator',
      phone: 018895956654,
      work: 'at Youtube inc.',
      gps: 'Saudi-Arabia',
      home: 'Cairo,Egypt',
    ),
    People(
      image: AssetImage('assets/4.jpg'),
      name: 'Dr.Magdi Yaccoub',
      description: 'Professor at XYZ University\nMBBS,FCPC',
      work: 'Hospital Punla Pacifica, USA.',
      phone: 0109569454,
      gps: '1736 Adams Ave, Toms River, NJ,08753',
      home: '1736 Adams Ave, Toms River, NJ,08753',
    ),
    People(
      image: AssetImage('assets/5.jpg'),
      name: 'Eng/ Mohamed Elsher',
      description: 'Professor at XYZ University\nMBBS,FCPC',
      phone: 950224545,
      work: 'Hospital Punla Pacifica, USA.',
      gps: '1736 Adams Ave, Toms River, NJ,08753',
      home: '1736 Adams Ave, Toms River, NJ,08753',
    ),
    People(
      image: AssetImage('assets/6.jpg'),
      name: 'Eng.Amr Samy',
      description: 'Flutter Developer.',
      work: 'SIM.',
      gps: '16-25 Elmammora',
      home: 'Alexandria,EGY',
    ),
    People(
      image: AssetImage('assets/7.jpg'),
      name: 'Lionel Messi',
      description: 'Barca Football Player',
      work: 'Catolonia.',
    ),
    People(
      image: AssetImage('assets/8.jpg'),
      name: 'CR.Ronaldo',
    ),
    People(
      image: AssetImage('assets/9.jpg'),
      name: 'Johny Mina',
    ),
    People(
      image: AssetImage('assets/10.jpg'),
      name: 'Johny Mina',
    ),
    People(
      image: AssetImage('assets/5.jpg'),
      name: 'Johny Mina',
    ),
    People(
      image: AssetImage('assets/4.jpg'),
      name: 'Johny Mina',
    ),
  ];

}
