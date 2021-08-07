
import 'package:flutter/material.dart';

import '../pre.dart';
import 'home.dart';

//import '../constants.dart';


class Authentication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashScreen(),
    );
  }
}


class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(color:Colors.white,
      padding: const EdgeInsets.fromLTRB(45.0,60.0,45.0,60.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Icon(Icons.circle_outlined , size:100,color:Color(0xff3e3b4e)),
          SizedBox(height:80),
          Expanded(
            child: Text('Start\nYour\nadventure',
              style: TextStyle(
                        color:Color(0xff3e3b4e),
                        fontSize:55,
                        fontWeight:FontWeight.w700,
                        //fontStyle: FontStyle.italic,
                        fontFamily:'Exo2'
                      ),
            ),
          ),

          ElevatedButton(
            onPressed: ()=> Navigator.push(context, MaterialPageRoute( builder: (context) => Scaffold(body:Login()) )),
            child: Text('Log in'),
            style: ElevatedButton.styleFrom(
              //primary: Colors.white,
              //onPrimary: Colors.blue,
              //onSurface:Colors.white,
              elevation: 10.0,
              textStyle: TextStyle(
                color:Colors.white,
                fontSize:35,
                fontWeight:FontWeight.bold,
                fontFamily:'BebasNeue',
                //fontStyle:FontStyle.italic
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ) ,
              fixedSize: Size(350, 70),
            ),
          ),

          SizedBox(height:50),


          InkWell(
          onTap: ()=> Navigator.push(context, MaterialPageRoute( builder: (context) => Scaffold(body:SignUp()) )),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(text:'You dont have an account? ',style: TextStyle(color:Colors.grey[800]),),
                  TextSpan(text:'Sign up here.',style: TextStyle(color:Colors.grey[800],fontWeight: FontWeight.bold,decoration: TextDecoration.underline))
                ],
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),

          SizedBox(height:10),


        ],
      ),
    );
  }
}

class Login extends StatelessWidget {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Column(
      children:[


        IconButton(
          icon: Icon(Icons.arrow_back_ios),
          iconSize: 35,
          onPressed: (){

          },
        ),

        Text('Log In',style: TextStyle(fontFamily: 'BebasNeue',color:Colors.red,fontWeight:FontWeight.bold),),

        TextFormField(
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.email),
            //border: UnderlineInputBorder( borderSide:)
            //border: UnderlineInputBorder( borderSide:BorderSide(color: Colors.grey,width: 2.0) ),
            enabledBorder: UnderlineInputBorder( borderSide:BorderSide(color: Colors.grey,width: 2.0) ),
            focusedBorder: UnderlineInputBorder( borderSide:BorderSide(color: Colors.yellow,width: 2.0) ),
          ),
          controller: emailController,
          validator: (value){
            if ( !value.contains('@') )
              return 'Must enter a valid Email';
            return null;
          },
        ),

        TextFormField(
          decoration: InputDecoration(
            labelText: 'Label text',
            hintText: 'hint text',
            contentPadding: EdgeInsets.all(20.0),
            prefixIcon: Icon(Icons.password),
            //border: UnderlineInputBorder( borderSide:BorderSide(color: Colors.grey,width: 2.0) ),
            enabledBorder: UnderlineInputBorder( borderSide:BorderSide(color: Colors.grey,width: 2.0) ),
            focusedBorder: UnderlineInputBorder( borderSide:BorderSide(color: Colors.yellow,width: 2.0) ),
          ),
          controller: emailController,
          validator: (value){
            if ( value.length < 8 )
              return 'Must be more than 8 characters';
            return null;
          },
        ),

        //Text(errormessage);

        ElevatedButton(
          child: Text('Log in'),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute( builder: (context) => Scaffold(body:PRE(Home())) ) );
          },
        ),

        InkWell(
          onTap: ()=> Navigator.push(context, MaterialPageRoute( builder: (context) => Scaffold(body:SignUp()) )),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(text:'First time here?'),
                TextSpan(text:'Sign up.'),
              ]
            )
          ),
        ),


      ]
    );
  }
}

class SignUp extends StatelessWidget {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

        IconButton(
          icon: Icon(Icons.arrow_back_ios),
          iconSize: 35,
          onPressed: (){
          },
        ),

        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text('New Account'),
            RichText(
              text:TextSpan(
                children: [
                  TextSpan(text:'1',style:TextStyle(fontWeight:FontWeight.bold)),
                  TextSpan(text:'/'),
                  TextSpan(text:'2\n'),
                  TextSpan(text:'STEPS'),
                ],
              )
            )
          ],
        ),

        Row(
          children: [

            CircleAvatar(
              child: Icon(Icons.link),
              radius: 40,
            ),

            Text('Upload a profile picture \n(optional)'),
          ],
        ),

        TextFormField(
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.email),
            //border: UnderlineInputBorder( borderSide:)
            //border: UnderlineInputBorder( borderSide:BorderSide(color: Colors.grey,width: 2.0) ),
            enabledBorder: UnderlineInputBorder( borderSide:BorderSide(color: Colors.grey,width: 2.0) ),
            focusedBorder: UnderlineInputBorder( borderSide:BorderSide(color: Colors.yellow,width: 2.0) ),
          ),
          controller: emailController,
          validator: (value){
            if ( !value.contains('@') )
              return 'Must enter a valid Email';
            return null;
          },
        ),

        TextFormField(
          decoration: InputDecoration(
            labelText: 'Label text',
            hintText: 'hint text',
            contentPadding: EdgeInsets.all(20.0),
            prefixIcon: Icon(Icons.password),
            //border: UnderlineInputBorder( borderSide:BorderSide(color: Colors.grey,width: 2.0) ),
            enabledBorder: UnderlineInputBorder( borderSide:BorderSide(color: Colors.grey,width: 2.0) ),
            focusedBorder: UnderlineInputBorder( borderSide:BorderSide(color: Colors.yellow,width: 2.0) ),
          ),
          controller: emailController,
          validator: (value){
            if ( value.length < 8 )
              return 'Must be more than 8 characters';
            return null;
          },
        ),

        //Text(errormessage);

        ElevatedButton(
          child: Text('Next'),
          onPressed: (){

          },
        ),

        InkWell(
          onTap: ()=> Navigator.push(context, MaterialPageRoute( builder: (context) => Scaffold(body:Login()) )),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(text:'Not the first time here?'),
                TextSpan(text:'Log in.')
              ]
            )
          ),
        ),


        ],
      ),
    );
  }
}