import 'package:flutter/material.dart';
import '../exporter.dart';

/*
class MySliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate
{
  double max,min;
  Widget Function(double,double) myFunc;

  MySliverPersistentHeaderDelegate({@required this.max,@required this.min,@required this.myFunc  });

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return myFunc(maxExtent,minExtent);
  }
  
    @override
    double get maxExtent => max;
  
    @override
    double get minExtent => min;
  
    bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
  
}
*/



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
      body: CustomScrollView(
              slivers: [


              SliverAppBar(
                expandedHeight: 250,
                toolbarHeight: 70,
                pinned: true,
                floating: false,
                backgroundColor: Colors.transparent,
                //shadowColor: Colors.amberAccent,
                leading:
                  Padding(
                    padding: EdgeInsets.only(left: 3),
                    child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(12.0),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.black.withOpacity(.5)),
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 35,
                          ),
                        ),
                    ),
                  ),
                  

                actions: [
                    InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.only(right:10),
                        child: Container(
                          padding: const EdgeInsets.all(12.0),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.black.withOpacity(.5)),
                          child: Icon(
                            Icons.share,
                            color: Colors.white,
                            size: 35,
                          ),
                        ),
                      ),
                    )
                ],

                flexibleSpace: FlexibleSpaceBar(
                  background:
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
                ),

              ),


              SliverPadding(
                padding: const EdgeInsets.fromLTRB(20, 25, 25, 25),
                sliver: SliverToBoxAdapter(
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
                            //Provider.of<PeopleModel>(context).getPeople(1).description,
                            _people.description,
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
                          onPressed: () {
                            context.read<PeopleDetailsModel>().setFollowers(_people.id, 1 + context.read<PeopleDetailsModel>().getFollowers(_people.id) );
                          },
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
                )
              ),

              SliverPadding(
                padding: EdgeInsets.fromLTRB(20, 15, 25, 0),
                sliver: SliverToBoxAdapter(
                  child: Container(
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
                              context.watch<PeopleDetailsModel>().getFollowers(_people.id).toString(),
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
                              context.watch<PeopleDetailsModel>().getFollowing(_people.id).toString(),
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
                              context.watch<PeopleDetailsModel>().getLikes(_people.id).toString(),
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
                              context.watch<PeopleDetailsModel>().getShots(_people.id).toString(),
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
                              context.watch<PeopleDetailsModel>().getLoved(_people.id).toString(),
                              style:
                                  TextStyle(color: Color(0xff375c80), fontSize: 20.0),
                            )
                          ],
                        )
                      ],
                    ),
                  ), 
                ),
              ),

              SliverPadding(
                padding: EdgeInsets.fromLTRB(20, 10, 25, 0),
                sliver: SliverToBoxAdapter(
                  child: Text(
                    context.watch<PeopleDetailsModel>().getBio(_people.id),
                    style: TextStyle(
                      color: Colors.white.withOpacity(.9),
                      fontSize: 18,  
                    ),
                  ),
                )
              ),
              
      
            SliverPadding(
              padding: const EdgeInsets.only(top:20.0,bottom:20.0),
              sliver: SliverToBoxAdapter(
                child: Align(
                  alignment: Alignment.topLeft,
                  child:Padding(
                    padding: const EdgeInsets.only(left:20),
                    child:Text('Skills',style: TextStyle(color: Colors.white,fontSize: 30),)
                  ),
                ),
              ),
            ),
            

            SliverPadding(
              padding: const EdgeInsets.only(right:5.0,left:5.0,bottom: 15.0),
              sliver: SliverToBoxAdapter(
                child: Container(  height: 40,margin: EdgeInsets.only(left:10),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      MySkills('Mobile Applications'),
                      MySkills('Development'),
                      MySkills('GlassDoor'),
                      MySkills('Free Chips'),
                      MySkills('FireBase'),
                    ],
                  ),
                ),
              ),
            ),

            SliverPadding(
              padding: const EdgeInsets.only(right:5.0,left:5.0,bottom: 25.0),
              sliver: SliverToBoxAdapter(
                child: Container(  height: 40,margin: EdgeInsets.only(left:10),
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
              ),
            ),
            

            SliverPadding(
              padding: const EdgeInsets.only(left:15.0),
              sliver: SliverToBoxAdapter(
                child:  Text('Last 5 Post',style:Theme.of(context).textTheme.headline3  ),
              ),
            ),


            MyPosts( context.watch<PostModel>().getPosts(_people.id) , _people ),
            

            

            /*
            SliverToBoxAdapter(
              child:  Text('Portfolio',style:Theme.of(context).textTheme.headline3  ),
            ),


            SliverToBoxAdapter(
              child:  Container(
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
            ),

            */



              ]
            )
           );

  }


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




class MyPosts extends StatelessWidget {


  List<Post> _posts=[];
  List<Comment> _currentPostComments=[];
  People _people;

  
  MyPosts( Map<int,Post >_map , this._people )
  {
    _map.forEach((key, value) => _posts.add(value) );
  }


  @override
  Widget build(BuildContext context) {

        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (ctx,i){
          
              _currentPostComments.clear();
              _posts[i].comments.forEach((key, value) => _currentPostComments.add(value) );

                      return Column(children: [
                        
                        Row(children: [
                          CircleAvatar(
                            backgroundImage: _people.image,
                            radius: 40,
                          ),
                          Text(_people.name +'\n'+_people.email),
                          Spacer(),
                          Text('${_posts[i].date.day} / ${_posts[i].date.month}' ),
                          Icon(Icons.menu)
                        ]),

                        Text(_posts[i].postId.toString()    + '\n'),
                        Text(_posts[i].text                 + '\n'),
                        Text(_posts[i].likes.toString()     + '\n'),
                        Text(_posts[i].disLikes.toString()  + '\n'),


                        Column(
                          children: [
                            ..._currentPostComments.map((e) => Text(e.text)).toList(),

                            
                            

                          ],
                        ),

                        /*
                        ListView.builder(
shrinkWrap: true,
                          itemCount: _currentPostComments.length,
                          itemBuilder: (ctx,j){

                            return Container( height:100 ,child: Text('The ${j+1} Comment is ' + _currentPostComments[j].text));

                          },
                        )*/                  

                        
                      ]);

            },
            childCount: _posts.length,
          ),
        );

  }


}