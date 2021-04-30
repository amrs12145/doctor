import '../exporter.dart';

BuildContext contextSCREEN1;

class Screen1 extends StatelessWidget {
  People _people;
  Screen1(this._people);
  @override
  Widget build(contextSCREEN1) {
    return ListView(
      //Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        //MyCard( NetworkImage('https://api.time.com/wp-content/uploads/2014/07/301386_full1.jpg?w=800&quality=100') ,'Dr.Alina Sticra','Professor at MIT \n California,USA' ),
        MyCard(_people.image, _people.name, _people.description),

        //MyCard( AssetImage('assets/1.jpg') ,'مهندس . عمار الحمار','شاب عشريني يعشق أكل البط ومال اليتيم \nبيقول معلش وشاطر' ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MyIcon(Icons.call, Color(0xff008800)),
            MyIcon(Icons.video_call, Colors.red),
            MyIcon(Icons.mail_outline, Colors.blue),
          ],
        ),

        SizedBox(
          height: 20,
        ),

        MyExperience(Icons.work, Colors.blue, _people.work),
        MyExperience(Icons.location_on, Colors.red, _people.gps),
        MyExperience(Icons.home, Colors.green, _people.home),
        MyExperience(Icons.phone, Colors.black,
            _people.phone != null ? '0${_people.phone}' : '0'),
        AA(),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Achivements(Icons.school, 'Degree\'s',
                [Color(0xff3e609c), Colors.blue[200], Color(0xff3e609c)]),
            Achivements(Icons.people, 'Job Success',
                [Color(0xff744367), Color(0xff1565C0), Color(0xff744367)]),
          ],
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
    //)
  }
}

class AA extends StatelessWidget {
  @override
  Widget build(BuildContext contextBUTTON) {
    return FlatButton(
      onPressed: () {
        Navigator.pop(contextBUTTON);
      },
      child: Text('Click'),
    );
  }
}

class MyCard extends StatelessWidget {
  var _image;
  String _name;
  String _description;
  MyCard(this._image, this._name, this._description);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          children: <Widget>[
            /*  Image(
            image: _image ,
            width:  170,
            height: 170 ,
          )*/
            CircleAvatar(
              radius: 70,
              backgroundImage: _image,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              _name,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              _description,
              style:
                  TextStyle(fontSize: 14, color: Colors.black.withOpacity(.5)),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(.5),
              spreadRadius: 3,
              blurRadius: 3)
        ]),
        padding: EdgeInsets.all(25),
        margin: EdgeInsets.all(30),
      ),
    );
  }
}

class MyIcon extends StatelessWidget {
  IconData _iconData;
  Color _color;
  MyIcon(this._iconData, this._color);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(_iconData, color: _color),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: Colors.grey[400], blurRadius: 3, spreadRadius: 3)
        ],
        border: Border.all(width: 1.5, color: _color),
        color: Colors.white,
      ),
      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
      padding: EdgeInsets.all(9),
    );
  }
}

class MyExperience extends StatelessWidget {
  IconData _iconData;
  Color _color;
  String _text;
  MyExperience(this._iconData, this._color, this._text);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 0, 0, 15),
      child: Row(
        children: <Widget>[
          Container(
            child: Icon(_iconData, color: _color),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: _color.withOpacity(.1),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 1, color: _color)),
          ),
          SizedBox(width: 20),
          Text(_text,
              style: TextStyle(
                color: Colors.black.withOpacity(0.5),
              ))
        ],
      ),
    );
  }
}

class Achivements extends StatelessWidget {
  IconData _icon;
  String _text;
  List<Color> _colors;
  Achivements(this._icon, this._text, this._colors);
  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: EdgeInsets.all(20),
      width: 165,
      height: 165,
      decoration: BoxDecoration(
          color: Colors.red,
          gradient: LinearGradient(colors: _colors),
          border: Border.all(width: 1, color: _colors.first),
          borderRadius: BorderRadius.circular(18)),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              child: Icon(_icon, size: 50, color: Colors.white),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 1, color: Colors.blueGrey)),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              _text,
              style: TextStyle(color: Colors.white),
            ),
          ]),
    );
  }
}

/*                                    FAAAAAAAAAAAAAAAAAAIIIIIIIIIILDDDDDDDDDDDddd
int selected=0;
class MyAppBarIcon extends StatefulWidget {
  Function func;
  int index;
  //int selected=0;
  bool active;
  IconData _iconData;
  Color color;
  String _text;
  MyAppBarIcon(this._iconData,this._text,this.index,{this.active= false, this.func });

  @override
  _MyAppBarIconState createState() => _MyAppBarIconState();
}

class _MyAppBarIconState extends State<MyAppBarIcon> {
  @override
  Widget build(BuildContext context) {
    return
    Container(
      width: 80,
      child:FlatButton(
        //padding: EdgeInsets.all(0),
        onPressed: (){
         // widget.func !=null ? widget.func():print('False');/*****************/
          
          setState(
            (){
             selected = widget.index;
            }
          );
        },
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(widget._iconData,color:selected  == widget.index?Colors.blue:Colors.grey,),
            Text(widget._text+'${selected }',style: TextStyle(color:selected  == widget.index?Colors.blue:Colors.grey),)
          ],
        ),
      ),
    );
  }
}

class FixBottomNavigationBar extends StatefulWidget {
  @override
  _FixBottomNavigationBarState createState() => _FixBottomNavigationBarState();
}

class _FixBottomNavigationBarState extends State<FixBottomNavigationBar> {
  @override
  
  Widget build(BuildContext context) {
    return
    Container(
      height: 75,
      child:BottomAppBar(
          child:Row(

              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                MyAppBarIcon(Icons.home, 'Home', 0 ,active: true,),
                MyAppBarIcon(Icons.save_alt, 'Saved', 1 ),
                Container(child:FloatingActionButton(onPressed: (){setState((){});},child:Icon(Icons.add,color: Colors.white,)) ,),
                MyAppBarIcon(Icons.add_alert, 'Alert' , 2),
                MyAppBarIcon(Icons.menu, 'More', 3 , func: (){Navigator.pushNamed(context, 'more');},),


          ],),
      ),
    );
  }
}

*/
