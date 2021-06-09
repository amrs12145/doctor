
import 'package:doctor/exporter.dart';
import 'package:flutter_slidable/flutter_slidable.dart';


import 'dart:math' as math;

import 'package:calculess/calculess.dart' as calculess;
import 'package:vector_math/vector_math.dart' as vector_math;
import 'package:math_expressions/math_expressions.dart';

import 'div.dart';
import 'grad.dart';



class MyDiv extends StatefulWidget {
  People _operation;
  MyDiv(this._operation);

  @override
  _MyMyDivState createState() => _MyMyDivState();
}

class _MyMyDivState extends State<MyDiv> {

  Parser p = Parser();
  String eq = "x*1 - (-5)";
  Expression exp;

  String simple_expression_Derived_i = 'waiting';
  String simple_expression_Derived_j = 'waiting';
  String simple_expression_Derived_k = 'waiting';
  String i,j,k;
  double xvalue,yvalue,zvalue;
  double eval = 0;


  void evaluate(double _, double __,double ___)
  {
    // Bind variables:
    Variable x = Variable('x'), y = Variable('y') , z = Variable('z');
    ContextModel cm = ContextModel();
    cm.bindVariable(x, Number(_));
    cm.bindVariable(y, Number(__));
    cm.bindVariable(z, Number(___));

    // Evaluate expression:
    eval=0;
    eval += p.parse( i ).derive("x").evaluate(EvaluationType.REAL, cm);
    eval += p.parse( j ).derive("y").evaluate(EvaluationType.REAL, cm);
    eval += p.parse( k ).derive("z").evaluate(EvaluationType.REAL, cm);

  }


  void derv()
  {
    exp = p.parse( i );

    //expression = exp.toString();
    //simple_expression = exp.simplify().toString();
    //expression_Derived  = exp.derive("x").toString();
    simple_expression_Derived_i  = exp.derive("x").simplify().toString();

    exp = p.parse( j );

    //expression = exp.toString();
    //simple_expression = exp.simplify().toString();
    //expression_Derived  = exp.derive("y").toString();
    simple_expression_Derived_j  = exp.derive("y").simplify().toString();

    exp = p.parse( k );

    //expression = exp.toString();
    //simple_expression = exp.simplify().toString();
    //expression_Derived  = exp.derive("k").toString();
    simple_expression_Derived_k  = exp.derive("z").simplify().toString();

  }


  @override
  Widget build(BuildContext context) {
return ListView(
      children: [

        // Child num 1
        Container(
          
            height: 250,
            padding: EdgeInsets.all(25),
            margin: EdgeInsets.all(50),

            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 70,
                  backgroundImage: widget._operation.image,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  widget._operation.name,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  widget._operation.description,
                  style:
                      TextStyle(fontSize: 14, color: Colors.black.withOpacity(.5)),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.white, boxShadow: [BoxShadow(
                  color: Colors.black.withOpacity(.5),
                  spreadRadius: 3,
                  blurRadius: 3)
            ]),

        ),

        // Child num 2

        Column(
          children:[

            //Text(' Here is an example of the Calculator'),


            TextField(
              obscureText: false,  
              decoration: InputDecoration(  
                border: OutlineInputBorder(),  
                labelText: 'i',  
                hintText: 'i',  
              ),

              onChanged: (string){
                i = string;
              },
              onSubmitted: (string){
               i = string;
              },
            ),
            TextField(
              obscureText: false,  
              decoration: InputDecoration(  
                border: OutlineInputBorder(),  
                labelText: 'j',  
                hintText: 'j',  
              ),

              onChanged: (string){
                j = string;
              },
              onSubmitted: (string){
                j = string;
              },
            ),
            TextField(
              obscureText: false,  
              decoration: InputDecoration(  
                border: OutlineInputBorder(),  
                labelText: 'k',  
                hintText: 'k',  
              ),

              onChanged: (string){
                k = string;
              },
              onSubmitted: (string){
                k = string;
              },
            ),
            
              Row(children: [
                

                Container(
                  width: 100,
                  child: TextField(
                    decoration: InputDecoration(  
                    border: OutlineInputBorder(),  
                    labelText: 'x',
                    hintText: 'Enter x Value',  
                    ),

                    onChanged: (string){
                      xvalue = double.parse(string);
                    },
                    onSubmitted: (string){
                      xvalue = double.parse(string);
                    },
                  ),
                ),
                Container(
                  width: 100,
                  child: TextField(
                    decoration: InputDecoration(  
                    border: OutlineInputBorder(),  
                    labelText: 'y',
                    hintText: 'Enter y Value',  
                    ),

                    onChanged: (string){
                      yvalue = double.parse(string);
                    },
                    onSubmitted: (string){
                      yvalue = double.parse(string);
                    },
                  ),
                ),
                Container(
                  width: 100,
                  child: TextField(
                    decoration: InputDecoration(  
                    border: OutlineInputBorder(),  
                    labelText: 'z',
                    hintText: 'Enter z Value',  
                    ),
                    onChanged: (string){
                      zvalue = double.parse(string);
                    },
                    onSubmitted: (string){
                      zvalue = double.parse(string);
                    },
                  ),
                ),

              ],),
            TextButton(
              child: Text('Click me'),
              onPressed: (){
                
                evaluate( xvalue,yvalue,zvalue );
                derv();
                
                setState((){});


              },
            ),


            Container(
              child: Text('The Result is \n\n' +
                simple_expression_Derived_i + ' +' +
                simple_expression_Derived_j + ' +' +
                simple_expression_Derived_k + ' + \n the Evaluation is ' + eval.toString()
              ,
              style: TextStyle(
                color:Colors.purple,fontSize:30,fontWeight: FontWeight.bold,
              ),),
            )


          ]
        )

      ],
    );
  }
}