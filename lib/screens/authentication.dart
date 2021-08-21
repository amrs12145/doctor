
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

//import 'package:shared_preferences/shared_preferences.dart';

import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:doctor/constants.dart';
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
            child: Text('Start\nYour\nAdventure',
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
            onPressed: ()=> Navigator.push(context, MaterialPageRoute( builder: (context) => Login() )),
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
          onTap: ()=> Navigator.push(context, MaterialPageRoute( builder: (context) => SignUp() )),
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
  final formKey = GlobalKey<FormState>();


  void error(String s)
  {
    print(s);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: true,
      body: Container(
        color:Color(0xff464b57),
        padding: const EdgeInsets.fromLTRB(45.0,20.0,45.0,0),
        child: Form(
          key: formKey,
          child: ListView(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children:[


              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  color:Colors.white,
                  iconSize: 50,
                  onPressed:() => Navigator.pop(context),
                ),
              ),

              SizedBox(height:65),

              Text('Log In',style: TextStyle(fontSize: 40,color:Colors.white,fontWeight:FontWeight.bold),),

              SizedBox(height:50),


              MyTextFormField(
                emailController,
                (value){
                  if ( !value.contains('@') )return 'Enter a valid email'; return null;
                }
                ,'Email','enter a valid email',false,Icon(Icons.email,size:29)
              ),

              SizedBox(height: 15),
              
              MyTextFormField(
                passwordController,
                (value){
                  if ( value.length < 8 )return 'Enter more than 8 characters'; return null;
                }
                ,'Password','enter a valid email',true,Icon(Icons.lock_outlined,size:29)
              ),
              //Text(errormessage);

              SizedBox(height:60),

              MyElevatedButton('Log In',
                ()async{
                  if ( formKey.currentState.validate() )
                  {
                    try{
                      await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text);

                      Navigator.pushNamedAndRemoveUntil(context, Constants.homeScreen, (route) => false);
                    }
                    catch(e){
                      if (e.code == 'invalid-email')
                        error('Invalid Email');
                      else if (e.code == 'user-disabled')
                        error('User Disabled');
                      else if (e.code == 'user-not-found')
                        error('User not Found');
                      else if (e.code == 'wrong-password')
                        error('Wrong Password');
                      else
                        error('Actually i don\'t know the reason for that');
                    }


                  }
                }
              ),

              SizedBox(
                height: 35,
              ),
              InkWell(
                onTap: ()
                {
                  Navigator.push(context, MaterialPageRoute( builder: (context) => SignUp() ));
                },
                child: Center(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(text:'First time here?  '),
                        TextSpan(text:'Sign up.',style: TextStyle(color:Colors.blue)),
                      ],
                      style: TextStyle(),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),

              //Spacer(),


            ]
          ),
        ),
      ),
    );
  }
}

class SignUp extends StatefulWidget {

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final emailController = TextEditingController();
  final password1Controller = TextEditingController();
  final password2Controller = TextEditingController();
  final formKey = GlobalKey<FormState>();
  XFile image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color:Color(0xff464b57),
        padding: const EdgeInsets.fromLTRB(45.0,20.0,45.0,0),
        child: Form(
          key: formKey,
          child: ListView(

            children: [

              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  color:Colors.white,
                  iconSize: 50,
                  onPressed:() => Navigator.pop(context),
                ),
              ),

              SizedBox(height:35),


            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [

                Text('New\nAccount',style:TextStyle(fontSize:40,fontWeight:FontWeight.bold,color:Colors.white)),
                Spacer(),
                RichText(
                  text:TextSpan(
                    children: [
                      TextSpan(text:'1',style:TextStyle(fontWeight:FontWeight.bold,fontSize:35)),
                      TextSpan(text:'/'),
                      TextSpan(text:'2\n',style:TextStyle(color:Colors.grey)),
                      TextSpan(text:'STEPS',style:TextStyle(fontSize:15)),
                    ],
                    style: TextStyle(fontSize:30,letterSpacing: 2)
                  )
                ),
              ],
            ),

            SizedBox(height:45.0),

            InkWell(
              onTap: (){

                ImagePicker().pickImage(source: ImageSource.gallery).then( (value) => setState((){image=value;})  );
                
              },
              child: Row(
                children: [

                  Transform.rotate(
                    angle: 2.5 ,
                    child: Container(
                      child: Icon(Icons.link,color:Colors.white,size:50),
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        //backgroundColor: Colors.transparent,
                        //color: Colors.white,
                        border: Border.all(width: 3.0,color:Colors.white70),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),
                  ),
                  SizedBox(width:35.0),

                  image!=null ? Image.file(File(image.path),width:150,height:150) : Text('Upload a profile picture \n(optional)',style:TextStyle(color:Colors.white70)),

                ],
              ),
            ),

            SizedBox(height:40),


            MyTextFormField(
              emailController,
              (value){
                if ( !value.contains('@') )return 'Enter a valid email'; return null;
              }
              ,'Email','enter a valid email',false,Icon(Icons.email,size:29)
            ),

            MyTextFormField(
              password1Controller,
              (value){
                if ( value.length < 8 ) return 'Enter more than 8 characters';
                return null;
              }
              ,'Password','enter a password more than 8 characters',true,Icon(Icons.lock_outlined,size:29)
            ),

            MyTextFormField(
              password2Controller,
              (value){
                if ( value.length < 8 ) return 'Enter more than 8 characters';
                else if ( password1Controller.text != password2Controller.text ) return 'Not the same password';
                return null;
              }
              ,'Confirm your Password','Re-enter Your password',true,Icon(Icons.lock_outlined,size:29)
            ),


            //Text(errormessage);
            SizedBox(height:25),

            MyElevatedButton('Next',
              (){
                if ( formKey.currentState.validate() )
                {
                  Navigator.push(context,MaterialPageRoute(builder:(ctx)=> FinishSignUp(emailController.text,password1Controller.text,image) ));
                }
              },
            ),

            SizedBox(height: 25),

            InkWell(
              onTap: ()=> Navigator.push(context, MaterialPageRoute( builder: (context) => Scaffold(body:Login()) )),
              child: Center(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(text:'Not the first time here?  '),
                      TextSpan(text:'Log in.',style:TextStyle(color:Colors.white))
                    ],
                    style: TextStyle(color:Colors.grey),
                  )
                ),
              ),
            ),

            SizedBox(height: 30,),


            ],
          ),
        ),
      ),
    );
  }
}




class FinishSignUp extends StatelessWidget {

  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final String email;
  final String password;
  final XFile image;

  FinishSignUp(this.email,this.password,this.image);


  void error(String errorMSG)
  {
    print(errorMSG);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color:Color(0xff464b57),
        padding: const EdgeInsets.fromLTRB(45.0,20.0,45.0,0),
        child: Form(
          key: formKey,
          child: ListView(

            children: [

              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  color:Colors.white,
                  iconSize: 50,
                  onPressed:() => Navigator.pop(context),
                ),
              ),

              SizedBox(height:35),


            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [

                Text('Finish\nSetup',style:TextStyle(fontSize:40,fontWeight:FontWeight.bold,color:Colors.white)),
                Spacer(),
                RichText(
                  text:TextSpan(
                    children: [
                      TextSpan(text:'2',      style:TextStyle(fontWeight:FontWeight.bold,fontSize:35)),
                      TextSpan(text:'/'),
                      TextSpan(text:'2\n',    style:TextStyle(color:Colors.grey)),
                      TextSpan(text:'STEPS',  style:TextStyle(fontSize:15)),
                    ],
                    style: TextStyle(fontSize:30,letterSpacing: 2)
                  )
                ),
              ],
            ),

            SizedBox(height:45.0),



            MyTextFormField(
              nameController,
              (value){
                if ( value.length < 7 ) return 'more than 7 chars';
                return null;
              }
              ,'Name','Enter Your name',false,Icon(Icons.face_retouching_natural ,size:29)
            ),

            MyTextFormField(
              descriptionController,
              (value){
                if ( value.length < 12 ) return 'more than 12 chars';
                return null;
              }
              ,'Job','Enter Your Job',false,Icon(Icons.work ,size:29)
            ),



            TextFormField(
              style: TextStyle(color:Colors.white,fontSize:20),
              decoration: InputDecoration(
                labelText: 'Phone',
                labelStyle: TextStyle(color:Colors.grey,fontSize:19),
                hintText: 'Enter Your mobile number',
                hintStyle: TextStyle(color:Colors.black38,fontSize:19),
                contentPadding: const EdgeInsets.all(20),
                prefixIcon: Icon(Icons.phone ,size:29),
                prefixStyle: TextStyle(color:Colors.purple,fontSize: 35),
                //border: UnderlineInputBorder( borderSide:BorderSide(color: Colors.grey,width: 2.0) ),
                enabledBorder: UnderlineInputBorder( borderSide:BorderSide(color: Colors.grey,width: 2.0) ),
                focusedBorder: UnderlineInputBorder( borderSide:BorderSide(color: Color(0xff9e814b),width: 2.0) ),
              ),
              controller: phoneController,
              validator: (value)=> ( value.length < 8 ) ? 'Enter more than 8 characters' : null,
              keyboardType: TextInputType.phone,
            ),


            //Text(errormessage);
            SizedBox(height:25),

            MyElevatedButton('Finish',
              ()async{
                  if ( formKey.currentState.validate() )
                  {
                    try
                    {
                      UserCredential user = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
                      
                      if ( user.user.uid != null && image != null )
                      {
                        Reference ref = FirebaseStorage.instance.ref('users/ProfilePicture-${user.user.uid}');
                        await ref.putFile(File(image.path)).whenComplete(() => null);
                        String url = await ref.getDownloadURL();
                        
                        FirebaseFirestore.instance.collection('users').doc(user.user.uid).set({
                          'email' :email,
                          'name'  :nameController.text,
                          'job'   :descriptionController.text,
                          'phone' :phoneController.text,
                          'ProfilePictureURL' : url,
                          'timeWhenCreated' : Timestamp.now()
                        });
                        //Navigator.pushNamed(context,Constants.homeScreen);
                        Navigator.pushReplacementNamed(context,Constants.homeScreen);
                      }
                    }
                    on FirebaseAuthException catch(e)
                    {
                      if ( e.code == 'email-already-in-use')
                        error('email already in use');
                      else if ( e.code == 'invalid-email' )
                        error('invalid email');
                      else if ( e.code == 'operation-not-allowed' )
                        error('operation not allowed');
                      else if ( e.code == 'weak-password' )
                        error('weak password');
                      else
                        error('I dont know the reason for the error');
                    }


                  }
              },
            ),

            SizedBox(height: 25),

            InkWell(
              onTap: ()=> Navigator.push(context, MaterialPageRoute( builder: (context) => Scaffold(body:Login()) )),
              child: Center(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(text:'Not the first time here?  '),
                      TextSpan(text:'Log in.',style:TextStyle(color:Colors.white))
                    ],
                    style: TextStyle(color:Colors.grey),
                  )
                ),
              ),
            ),

            SizedBox(height: 30,),


            ],
          ),
        ),
      ),
    );
  }
}





class MyElevatedButton extends StatefulWidget {

  final String _text;
  final VoidCallback _onPressed;

  const MyElevatedButton(this._text,this._onPressed);

  @override
  _MyElevatedButtonState createState() => _MyElevatedButtonState();
}

class _MyElevatedButtonState extends State<MyElevatedButton> {

  Widget _child;
  
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: _child ?? Text(widget._text),
      onPressed: (){
        _child = CircularProgressIndicator();
        widget._onPressed();
        setState((){});
      },
      style: ElevatedButton.styleFrom(
        primary: Color(0xff21242c),
        fixedSize: Size(MediaQuery.of(context).size.width,70),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50)
        ),
        textStyle: TextStyle(fontSize:27,fontWeight:FontWeight.bold),
        elevation: 10
      ),

    );
  }
}

class MyTextFormField extends StatelessWidget {

  final TextEditingController _controller;
  final String Function(String s) _validator;
  final Widget _prefixIcon;
  final String _labelText,_hintText;
  final bool _obscureText;
  const MyTextFormField(this._controller,this._validator,this._labelText,this._hintText,this._obscureText,this._prefixIcon);


  @override
  Widget build(BuildContext context) {
    return Theme(
      data:Theme.of(context).copyWith(colorScheme: ThemeData().colorScheme.copyWith(primary:Color(0xff9e814b))),
      child: TextFormField(
        style: TextStyle(color:Colors.white,fontSize:20),
        obscureText: _obscureText,
        decoration: InputDecoration(
          labelText: _labelText,
          labelStyle: TextStyle(color:Colors.grey,fontSize:19),
          hintText: _hintText,
          hintStyle: TextStyle(color:Colors.black38,fontSize:19),
          contentPadding: const EdgeInsets.all(20),
          prefixIcon: _prefixIcon,
          prefixStyle: TextStyle(color:Colors.purple,fontSize: 35),
          //border: UnderlineInputBorder( borderSide:BorderSide(color: Colors.grey,width: 2.0) ),
          enabledBorder: UnderlineInputBorder( borderSide:BorderSide(color: Colors.grey,width: 2.0) ),
          focusedBorder: UnderlineInputBorder( borderSide:BorderSide(color: Color(0xff9e814b),width: 2.0) ),
        ),
        controller: _controller,
        validator: _validator,
      ),
    );
  }
}