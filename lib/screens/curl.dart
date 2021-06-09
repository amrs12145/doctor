
import 'package:doctor/exporter.dart';
import 'package:flutter_slidable/flutter_slidable.dart';


import 'dart:math' as math;

import 'package:calculess/calculess.dart' as calculess;
import 'package:vector_math/vector_math.dart' as vector_math;
import 'package:math_expressions/math_expressions.dart';






class MyCurl extends StatefulWidget {
  People _operation;
  MyCurl(this._operation);
  @override
  _MyCurlState createState() => _MyCurlState();
}

class _MyCurlState extends State<MyCurl> {

  Parser p = Parser();
  String eq = "x*1 - (-5)";
  Expression exp;

  String f1,f2,f3;
  String resulti='0',resultj='0',resultk='0';

  double xvalue,yvalue,zvalue;
  double evali,evalj,evalk;

  

  void evaluate(double _, double __,double ___)
  {
    // Bind variables:
    Variable x = Variable('x'), y = Variable('y') , z = Variable('z');
    ContextModel cm = ContextModel();
    cm.bindVariable(x, Number(_));
    cm.bindVariable(y, Number(__));
    cm.bindVariable(z, Number(___));


    evali =   (p.parse(f3).derive("y") - p.parse(f2).derive("z")).evaluate(EvaluationType.REAL, cm);
    evalj =   (-p.parse(f3).derive("x") - p.parse(f1).derive("z")).evaluate(EvaluationType.REAL, cm);
    evalk =   (p.parse(f2).derive("x") - p.parse(f1).derive("y")).evaluate(EvaluationType.REAL, cm);

  }


  void allCalc()
  {

    resulti = (p.parse(f3).derive("y") - p.parse(f2).derive("z")).toString();

    resultj = (p.parse(f3).derive("x") - p.parse(f1).derive("z")).toString();

    resultk = (p.parse(f2).derive("x") - p.parse(f1).derive("y")).toString();



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
                f1 = string;
              },
              onSubmitted: (string){
                f1 = string;
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
                f2 = string;
              },
              onSubmitted: (string){
                f2 = string;
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
                f3 = string;
              },
              onSubmitted: (string){
                f3 = string;
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
                allCalc();
                
                setState((){});


              },
            ),


            Container(
              child: Text('The Result is \n\n' +
                resulti + 'i + ' +
                resultj + 'j + ' +
                resultk + 'k + \n\n the Evaluation is ' +
                evali.toString() + 'i + ' + evalj.toString() +'j + '+ evalk.toString() + 'k\n\n\n'
              ,
              style: TextStyle(
                color:Colors.purple,fontSize:30,fontWeight: FontWeight.bold,
              ),
              ),
            )


          ]
        )

      ],
    );
  }
}