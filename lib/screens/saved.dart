
import 'package:doctor/exporter.dart';
import 'package:flutter_slidable/flutter_slidable.dart';


import 'dart:math' as math;

import 'package:calculess/calculess.dart' as calculess;
import 'package:vector_math/vector_math.dart' as vector_math;
import 'package:math_expressions/math_expressions.dart' as math_expressions;

import 'Calculations.dart';


class Saved extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 8 ,
      itemBuilder: (context, i) {
        return BAR(
          context.watch<PeopleModel>().getOperations(i)
        );
      },
    );
  }
}



class BAR extends StatelessWidget {
  //People people;
  People _people;
  BAR( this._people );

  @override
  Widget build(BuildContext contextCONTACT) {
    return Slidable(
      actionPane: SlidableStrechActionPane(),
      secondaryActions: [

        Container(color: Colors.green),

        SlideAction(
          closeOnTap: true,
          child: TextButton(
                  onPressed: (){

                  }, 
                  child: Icon(Icons.delete) 
                )

        ),


      ],

      child: FlatButton(
          padding: EdgeInsets.all(0),
          highlightColor: Colors.red,
          onPressed: () {
            Navigator.push(
              contextCONTACT,
              MaterialPageRoute(
                  builder: (BuildContext context) => PRE( Calculations( _people )  ),
              )
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
