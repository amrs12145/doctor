import 'package:flutter/material.dart';
import '../exporter.dart';

class More extends StatelessWidget {
  People _people;
  @override
  Widget build(BuildContext context) {

    final argumentsPassed = ModalRoute.of(context).settings.arguments as People;
    if ( argumentsPassed != null )
      _people = argumentsPassed;
    else
      _people = context.read<PeopleModel>().getPeople(6);

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xff092845),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(  padding: EdgeInsets.all(0),
          children: <Widget>[

            Stack(
              //overflow: Overflow.clip,
              //alignment: Alignment.bottomLeft,
              children: <Widget>[
                /*Align(
                  alignment: Alignment.bottomRight,
                  child:Text('bottomRight',style: TextStyle(color:Colors.blue,fontSize: 26.0),),
                ),*/

                InkWell(
                  onTap: () => showModalBottomSheet(context: context,isScrollControlled: true ,builder: (_){
                    return Container(
                      width: MediaQuery.of(_).size.width,
                      height: MediaQuery.of(_).size.height-50,
                      color: Colors.black,
                      child: Stack(
                        children: 
                        [
                          Center(child: Image(image: _people.image,)),
                            
                          Padding(
                            padding: const EdgeInsets.only(top: 35,left: 15),
                            child: IconButton(
                              onPressed: ()=> Navigator.of(_).pop(),
                              icon: Icon(Icons.close,color: Colors.white,),
                              //color:Colors.purple,
                              iconSize: 45,
                            ),
                          ),


                        ]
                      ),
                    );
                  }),
                  child: Container(
                    width: size.width,
                    height: size.height * .3,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: _people.image,
                            fit: BoxFit.cover
                        ),
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50),bottomRight: Radius.circular(50))
                    ),
                  ),
                ),
                Positioned(
                    left: 0,
                    top: 45,
                    child: FlatButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black.withOpacity(.5)),
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 35,
                        ),
                      ),
                    )),
                Positioned(
                    right: 0,
                    top: 45,
                    child: FlatButton(
                      onPressed: () {},
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black.withOpacity(.5)),
                        child: Icon(
                          Icons.share,
                          color: Colors.white,
                          size: 35,
                        ),
                      ),
                    )),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 25, 25, 25),
              child: Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        _people.name,
                        textAlign: TextAlign.start,
                        style: TextStyle(color: Colors.white, fontSize: 26),
                      ),
                      Text(
                        Provider.of<PeopleModel>(context).getPeople(1).description,
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(color: Color(0xff375c80), fontSize: 14),
                      ),
                    ],
                  ),
                  Spacer(),
                  Container(
                    //decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color: Colors.red),
                    child: RaisedButton(
                      onPressed: () {},
                      elevation: 20,
                      color: Color(0xffff9800),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          'Follow',
                          style: TextStyle(color: Color(0xff092854)),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:20,right:25) ,
              child:Container(
                height: 70,
                //color: Colors.red,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[

                    Column(
                      children: <Widget>[
                        Text(
                          'Followers',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          '9 069',
                          style:
                              TextStyle(color: Color(0xff375c80), fontSize: 20.0),
                        )
                      ],
                    ),
                    myDivider(),
                    Column(
                      children: <Widget>[
                        Text('Following', style: TextStyle(color: Colors.white)),
                        Text(
                          '567',
                          style:
                              TextStyle(color: Color(0xff375c80), fontSize: 20.0),
                        )
                      ],
                    ),
                    myDivider(),
                    Column(
                      children: <Widget>[
                        Text('Likes', style: TextStyle(color: Colors.white)),
                        Text(
                          '5 299',
                          style:
                              TextStyle(color: Color(0xff375c80), fontSize: 20.0),
                        )
                      ],
                    ),
                    myDivider(),
                    Column(
                      children: <Widget>[
                        Text('Shots', style: TextStyle(color: Colors.white)),
                        Text(
                          '1583',
                          style:
                              TextStyle(color: Color(0xff375c80), fontSize: 20.0),
                        )
                      ],
                    ),
                    Container(
                        color: Colors.white.withOpacity(.4),//INSTEAD of Using myDivider i used MARGIN
                        //height: 50,    DOENST FU**ing WORK
                        width: .5,
                        margin: const EdgeInsets.only(left:20,right:20,top: 0,bottom: 30),
                      ),
                    Column(
                      children: <Widget>[
                        Text('Loved', style: TextStyle(color: Colors.white)),
                        Text(
                          '158',
                          style:
                              TextStyle(color: Color(0xff375c80), fontSize: 20.0),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:20,right:25) ,
              child:Text(
                'Lorem ipsum is the short-hand term for the most popular placeholder text in history, ... Lorem Ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod ...',
                style: TextStyle(
                  color: Colors.white.withOpacity(.9),
                  fontSize: 18,  
                ),
              ),
            ),

          SizedBox(height: 20,),
          Align(alignment: Alignment.topLeft,
          child:Padding(
            padding: const EdgeInsets.only(left:20),
            child:Text('Skills',style: TextStyle(color: Colors.white,fontSize: 30),)
          ),),

          SizedBox(height: 15,),

          Container(  height: 40,margin: EdgeInsets.only(left:10),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                      MySkills('UX Design'),
                      MySkills('UI Design'),
                      MySkills('Flutter'),
                      MySkills('Front-End Development'),
                      MySkills('FireBase'),
              ],
            ),
          ),
          SizedBox(height: 12,),
          Container(  height: 40,margin: EdgeInsets.only(left:10),
            child:ListView(
              scrollDirection: Axis.horizontal,
              children: [
                      MySkills('FireBase'),
                      MySkills('Senior Software Engineer'),
                      MySkills('Back-End Development'),
                      MySkills('Bachelor of Software Engineering'),
                      MySkills('Mobile Application Developer'),
              ],
            ),
          ),

          SizedBox(height: 30,),
          Text('Portfolio',style:Theme.of(context).textTheme.headline3  ),

   
          Container(
            height: 500,
            child: GridView.count(
              padding: const EdgeInsets.only(left: 20,right:25),
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              childAspectRatio: 1,
              children: 
                List.generate(20, (int index) => Image.asset('assets/${index+2}.jpg',fit: BoxFit.fill,) )
              ,
            ),
          ),


          ],
        ),
      ),
    );
  }

  Widget myDivider() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
            color: Colors.white.withOpacity(.4),
            height: 40,
            width: .5,
            margin: const EdgeInsets.only(left:20,right:20),
            
          ),
      ],
    );
  }

}

class MySkills extends StatelessWidget {
  String _text;
  MySkills(this._text);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(_text,style: TextStyle(fontSize: 16,color: Colors.black.withOpacity(.55) ),),
      decoration: BoxDecoration(
        color:Colors.blue,
        borderRadius: BorderRadius.circular(20),
        //border: Border.all(color:Colors.white,width:0),
        boxShadow: [
          BoxShadow(
            color:Colors.lightBlue,
            blurRadius:4,
          )
        ]
      ),
      padding: const EdgeInsets.only(left:15,right: 15 ),
      margin: const EdgeInsets.only(right:8.0),
    );
  }
}
