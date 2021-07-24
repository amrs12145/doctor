import 'package:doctor/exporter.dart';

class People {
  int id;
  var image;
  int phone;
  String name, email , link , description, work, gps, home;

  People(
  {
    @required this.id,
    @required this.image,
    @required this.name,
    this.email ='amrs12145@gmail.com',
    this.link = 'https://flutter.dev',
    this.description = 'Professor at XYZ University\nMBBS,FCPC',
    this.work = 'Hospital Punla Pacifica, USA.',
    this.gps = '1736 Adams Ave, Toms River, NJ,08753',
    this.home = '1736 Adams Ave, Toms River, NJ,08753',
    this.phone
  });
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

  void addPeople( { @required int id , @required var image , @required String name , String description , int phone , String home } )
  {
    _people.add(  People(
          id: id,
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



  List<People> _people = <People>[
    People(
      id: 15,
      image: AssetImage('assets/8.jpg'),
      name: 'م/ عمار الركابي',
      description: 'وصف  وصف وصصصصف',
      phone: 01286969796,
      work: 'sim.',
      gps: 'under the esclator',
      home: '45',
    ),
    People(
      id: 1,
      image: AssetImage('assets/2.jpg'),
      name: 'DR.Alina Stlera',
      description: 'Professor at XYZ University\nMBBS,FCPC',
      phone: 950 - 251 - 254,
      work: 'Hospital Punla Pacifica, USA.',
      gps: '1736 Adams Ave, Toms River, NJ,08753',
      home: '1736 Adams Ave, Toms River, NJ,08753',
    ),
    People(
      id: 2,
      image: AssetImage('assets/3.jpg'),
      name: 'Eng.Osama Elzero',
      description: 'Youtube Creator',
      phone: 018895956654,
      work: 'at Youtube inc.',
      gps: 'Saudi-Arabia',
      home: 'Cairo,Egypt',
    ),
    People(
      id: 3,
      image: AssetImage('assets/4.jpg'),
      name: 'Dr.Magdi Yaccoub',
      description: 'Professor at XYZ University\nMBBS,FCPC',
      work: 'Hospital Punla Pacifica, USA.',
      phone: 0109569454,
      gps: '1736 Adams Ave, Toms River, NJ,08753',
      home: '1736 Adams Ave, Toms River, NJ,08753',
    ),
    People(
      id: 4,
      image: AssetImage('assets/5.jpg'),
      name: 'Eng/ Mohamed Elsher',
      description: 'Professor at XYZ University\nMBBS,FCPC',
      phone: 950224545,
      work: 'Hospital Punla Pacifica, USA.',
      gps: '1736 Adams Ave, Toms River, NJ,08753',
      home: '1736 Adams Ave, Toms River, NJ,08753',
    ),
    People(
      id: 5,
      image: AssetImage('assets/6.jpg'),
      name: 'Eng.Amr Samy',
      description: 'Flutter Developer.',
      work: 'SIM.',
      gps: '16-25 Elmammora',
      home: 'Alexandria,EGY',
    ),
    People(
      id: 6,
      image: AssetImage('assets/7.jpg'),
      name: 'Lionel Messi',
      description: 'Barca Football Player',
      work: 'Catolonia.',
    ),
    People(
      id: 7,
      image: AssetImage('assets/8.jpg'),
      name: 'CR.Ronaldo',
    ),
    People(
      id: 8,
      image: AssetImage('assets/9.jpg'),
      name: 'Johny Mina',
    ),
    People(
      id: 9,
      image: AssetImage('assets/10.jpg'),
      name: 'Johny Mina',
    ),
    People(
      id: 10,
      image: AssetImage('assets/5.jpg'),
      name: 'Johny Mina',
    ),
    People(
      id: 11,
      image: AssetImage('assets/4.jpg'),
      name: 'Johny Mina',
    ),
  ];

}
