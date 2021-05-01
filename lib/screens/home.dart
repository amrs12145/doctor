import 'package:flutter/gestures.dart';

import '../exporter.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext contextHome) {
    return ListView.builder(
      itemCount: Provider.of<PeopleModel>(contextHome).getLength ,
      itemBuilder: (context, i) {
        return Contact(
          //AssetImage('assets/${i+1}.jpg')
          Provider.of<PeopleModel>(contextHome).getPeople(i),
        );
      },
    );
  }
}

class Contact extends StatelessWidget {
  //People people;
  People _people;
  Contact(this._people);
  @override
  Widget build(BuildContext contextCONTACT) {
    return Slidable(
      actionPane: SlidableStrechActionPane(),
      actions: [
        Container(color: Colors.green),
        TextButton(
          onPressed: (){
            Provider.of<PeopleModel>(contextCONTACT).removePeople( this._people );
          }, 
          child: Icon(Icons.delete) 
        )
      ],/*
      secondaryActions: [
        Container(color: Colors.amber),
        Container(color: Colors.purple),
        Container(color: Colors.lime),
        Container(color: Colors.red),
        //Container(color: Colors.lime),
      ],*/
      child: FlatButton(
          padding: EdgeInsets.all(0),
          highlightColor: Colors.red,
          onPressed: () {
            Navigator.push(
              contextCONTACT,
              MaterialPageRoute(
                  builder: (BuildContext context) => PRE(Screen1(_people))),
            );
          },
          child: Container(
            padding: EdgeInsets.all(15),
            //margin: EdgeInsets.only(left:5),
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(color: Colors.grey[300], blurRadius: 5, spreadRadius: 5)
            ]),
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: _people.image,
                  radius: 40,
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      _people.name,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      _people.description,
                      style: TextStyle(color: Colors.blueGrey, fontSize: 15),
                    ),
                  ],
                ),

                Spacer(),
                Icon(
                  Icons.check_circle,
                  size: 25,
                  color: Colors.green,
                ),
                Icon(
                  Icons.keyboard_arrow_right,
                  size: 30,
                  color: Colors.black.withOpacity(.6),
                ),
                //SizedBox(width: 10,),
              ],
            ),
          )),
    );
  }
}
