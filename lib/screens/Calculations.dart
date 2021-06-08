
import 'package:doctor/exporter.dart';
import 'package:flutter_slidable/flutter_slidable.dart';


import 'dart:math' as math;

import 'package:calculess/calculess.dart' as calculess;
import 'package:vector_math/vector_math.dart' as vector_math;
import 'package:math_expressions/math_expressions.dart';







class Calculations extends StatefulWidget {
  People _operation;
  Calculations(this._operation);

  @override
  _CalculationsState createState() => _CalculationsState();
}

class _CalculationsState extends State<Calculations> {

  

  Parser p = Parser();
  String eq = "x*1 - (-5)";
  Expression exp;

  String expression = 'Waiting';
  String simple_expression = 'Waiting';
  String expression_Derived = 'Waiting';
  String simple_expression_Derived = 'Waiting';



  

  void derv()
  {
    exp = p.parse( eq );

    expression = exp.toString();
    simple_expression = exp.simplify().toString();
    expression_Derived  = exp.derive("x").toString();
    simple_expression_Derived  = exp.derive("x").simplify().toString();
  }


  double sin(x) 
  {
    return math.cos(x);
  }

  double res =0;
  int start,end;
  void integrate( String s , int start ,int end )
  {
    res =  s=='s' ? calculess.Calc.integral(start, end , (x) => math.sin(x) , 10000): res;
    res=   s=='c' ? calculess.Calc.integral(start, end , (x) => math.cos(x) , 10000): res;
    res=   s=='t' ? calculess.Calc.integral(start, end , (x) => math.tan(x) , 10000): res;
    res=   s=='l' ? calculess.Calc.integral(start, end , (x) => math.log(x) , 10000): res;
    //calculess.Calc.integral(0, math.pi , (x) => math.sin(x) , 10000);

  }

    

  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: [

        // Child num 1
        Container(
          
            height: 250,
            padding: EdgeInsets.all(25),
            margin: EdgeInsets.only(left:90,top:30),

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

            Text(' Here is an example of the Calculator'),

            TextField( 
              obscureText: false,  
              decoration: InputDecoration(  
                border: OutlineInputBorder(),  
                labelText: '1st',  
                hintText: 'Enter the 1st Equation',  
              ),

              onChanged: (string){
                eq = string;
              },
              onSubmitted: (string){
                eq = string;
              },
            ),
            TextField(
              obscureText: false,  
              decoration: InputDecoration(  
                border: OutlineInputBorder(),  
                labelText: 'start',  
                hintText: 'integration limits',  
              ),

              onChanged: (string){
                start = int.parse(string);
              },
              onSubmitted: (string){
                start = int.parse(string);
              },
            ),
            TextField(
              obscureText: false,  
              decoration: InputDecoration(  
                border: OutlineInputBorder(),  
                labelText: 'end',  
                hintText: 'integration limits',  
              ),

              onChanged: (string){
                start = int.parse(string);
              },
              onSubmitted: (string){
                start = int.parse(string);
              },
            ),
            TextButton(
              child: Text('Click me'),
              onPressed: (){
                
                if ( widget._operation.name == 'differentiation'  )
                {
                  derv();
                }
                else if ( widget._operation.name == 'Integration' )
                {
                  integrate( eq[0] , start , end );
                }
                
                setState((){});


              },
            ),


            Container(
              child: Text('The Result is \n' +
                'the expression is                  '  + expression + '\n' +
                'the simple expression is           '  + simple_expression + '\n' +
                'the Derived is                     '  + expression_Derived + '\n' +
                'the simple Derived is              '  + simple_expression_Derived 
                ),
            )


          ]
        )

      ],
    );

  
  }
}


String status(int i)
{
  return i == 0 ? 'differentiation' : i==1 ?  'integration' : i==2 ? 'Vectors' : i==3 ? 'Divergence' : i==4?  'Curl' : 'Not Implemented';
}