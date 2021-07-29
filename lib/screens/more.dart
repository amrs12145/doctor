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


  List<String> getTags(BuildContext context)
  {
    return context.watch<PeopleTagsModel>().getPeopleTags(_people.id).tags;
  }

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
                                  
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 35,right: 15),
                                    child: IconButton(
                                      onPressed: ()=> Navigator.of(_).pop(),
                                      icon: Icon(Icons.close,color: Colors.white,),
                                      //color:Colors.purple,
                                      iconSize: 50,
                                    ),
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
                  child: ListView.builder(
                    
                    scrollDirection: Axis.horizontal,
                    itemCount: getTags(context).length ~/2 ,
                    itemBuilder: (ctx,i) => MySkills( getTags(context)[i] ),

                  ),
                ),
              ),
            ),

            SliverPadding(
              padding: const EdgeInsets.only(right:5.0,left:5.0,bottom: 25.0),
              sliver: SliverToBoxAdapter(
                child: Container(  height: 40,margin: EdgeInsets.only(left:10),
                  child: ListView.builder(
                    
                    scrollDirection: Axis.horizontal,
                    itemCount: getTags(context).length.isOdd ? (getTags(context).length+1)~/2  : (getTags(context).length~/2) ,

                    itemBuilder: (ctx,i) => MySkills( getTags(context)[  i + getTags(context).length~/2  ] ),

                  ),
                ),
              ),
            ),
            

            SliverPadding(
              padding: const EdgeInsets.only(left:15.0,bottom:33),
              sliver: SliverToBoxAdapter(
                child:  Text('Last 5 Post',style:TextStyle(color:Colors.white,fontSize:30)  ),
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



  Widget myComment(Comment comment , BuildContext context)
  {
    People commenter = context.read<PeopleModel>().getPeopleWithId(comment.commenterId);

    return Container(
        padding: const EdgeInsets.fromLTRB(15.0,55.0,15.0,0.0),
        //color:Colors.red,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [


            Row(children: [

              InkWell(
                onTap: () => showModalBottomSheet(context: context,isScrollControlled: true ,builder: (_){
                  return Container(
                    width: MediaQuery.of(_).size.width,
                    height: MediaQuery.of(_).size.height-50,
                    color: Colors.black,
                    child: Stack(
                      children: 
                      [
                        Center(child: Image(image: commenter.image,)),
                          
                        Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 35,right: 15),
                            child: IconButton(
                              onPressed: ()=> Navigator.of(_).pop(),
                              icon: Icon(Icons.close,color: Colors.white,),
                              //color:Colors.purple,
                              iconSize: 50,
                            ),
                          ),
                        ),


                      ]
                    ),
                  );
                }),
                child: CircleAvatar(
                  backgroundImage: commenter.image,
                  radius: 30,
                ),
              ),

              SizedBox(width: 15,),
              Text(commenter.name + '\n@' + commenter.email.split('@')[0] ,style: TextStyle(color: Colors.grey[400]),),
              Spacer(),
              Text( (DateTime.now().day - comment.date.day).toString() + 'd' ,style: TextStyle(color: Colors.grey[400],fontSize: 15),),
              Icon(Icons.keyboard_arrow_down),
            ],),
            
            SizedBox(height:30),
            Text(comment.text + '\n',style:TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color:Colors.white70,height: 1.5,),textAlign: TextAlign.center,),

            Row(
              children: [
                Text('${comment.likes} ',    style: TextStyle(color:Colors.grey,fontWeight: FontWeight.bold) ),
                Icon(Icons.favorite,          size: 26, color:Colors.red[800] ),
                Text('       ${comment.disLikes} ', style: TextStyle(color:Colors.grey,fontWeight: FontWeight.bold) ),
                Icon(Icons.favorite_border,          size: 26, color:Colors.grey[400]),
              ],
            ),
            Divider(height: 40,thickness: 1,color:Colors.white,indent:0),


          ],
        )
      );
  }
  @override
  Widget build(BuildContext context) {

        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (ctx,i){


                      return Container(decoration: BoxDecoration(color:Colors.white.withOpacity(.15)),padding: EdgeInsets.fromLTRB(8.0,35.0,8.0,35.0),
                        child: Column(children: [
                          
                          Row(children: [

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
                                        
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: Padding(
                                          padding: const EdgeInsets.only(top: 35,right: 15),
                                          child: IconButton(
                                            onPressed: ()=> Navigator.of(_).pop(),
                                            icon: Icon(Icons.close,color: Colors.white,),
                                            //color:Colors.purple,
                                            iconSize: 50,
                                          ),
                                        ),
                                      ),


                                    ]
                                  ),
                                );
                              }),
                              child: CircleAvatar(
                                backgroundImage: _people.image,
                                radius: 30,
                              ),
                            ),


                            SizedBox(width: 15,),
                            Text(_people.name +'\n'+_people.email,style: TextStyle(color: Colors.grey[400],height:1.8)),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(right:10.0),
                              child: ElevatedButton(
                                child: Icon(Icons.menu),
                                style: ElevatedButton.styleFrom(
                                  primary: Color(0xff092845),
                                  elevation: 8
                                ),
                                onPressed:()=> showBottomSheet(context: context, builder: (ctx){

                                    return Container(
                                      padding: const EdgeInsets.only(top:55.0,left:20,right:20,bottom:25),
                                      color: Color(0xff092845),
                                      child: ListView(
                                        children: [
                                          
                                          Padding(
                                            padding: const EdgeInsets.only(),
                                            child: IconButton(
                                              alignment: Alignment.topRight,
                                              onPressed: ()=> Navigator.of(ctx).pop(),
                                              icon: Icon(Icons.close,color: Colors.white,),
                                              //color:Colors.purple,
                                              iconSize: 60,
                                            ),
                                          ),

                                          Row(children: [
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
                                                        
                                                      Align(
                                                        alignment: Alignment.topRight,
                                                        child: Padding(
                                                          padding: const EdgeInsets.only(top: 35,right: 15),
                                                          child: IconButton(
                                                            onPressed: ()=> Navigator.of(_).pop(),
                                                            icon: Icon(Icons.close,color: Colors.white,),
                                                            //color:Colors.purple,
                                                            iconSize: 50,
                                                          ),
                                                        ),
                                                      ),


                                                    ]
                                                  ),
                                                );
                                              }),
                                              child: CircleAvatar(
                                                backgroundImage: _people.image,
                                                radius: 30,
                                              ),
                                            ),
                                            SizedBox(width: 15,),
                                            Text(_people.name +'\n'+_people.email,style: TextStyle(color: Colors.grey[400],height:1.8)),
                                          ]),

                                          SizedBox(height:30),
                                          Text(_posts[i].text + '\n',style:TextStyle(
                                            fontSize: 30,fontWeight: FontWeight.bold,color:Colors.white,height: 1.6),textAlign: TextAlign.center,
                                          ),
                                          Align(alignment:Alignment.topLeft,child: Text('${_posts[i].date.hour}:${_posts[i].date.minute} . ${_posts[i].date.day} / ${_posts[i].date.month} / ${_posts[i].date.year}' ,style: TextStyle(color:Colors.grey[400]),) ),
                                          Divider(height: 40,thickness: 1,color:Colors.white,indent:0),
                                          //Text(_posts[i].likes.toString()     + ' Likes'),
                                          //Text(_posts[i].disLikes.toString()  + ' dislikes\n'),
                                          
                                          RichText(
                                            textAlign: TextAlign.center,
                                            text:TextSpan(children: [
                                              TextSpan(text:'${_posts[i].likes}  ',            style: TextStyle(color:Colors.black,fontWeight: FontWeight.bold) ),
                                              TextSpan(text:'Likes    ',                       style: TextStyle(color:Colors.grey) ),
                                              TextSpan(text:'${_posts[i].disLikes}  ',         style: TextStyle(color:Colors.black,fontWeight: FontWeight.bold) ),
                                              TextSpan(text:'dislikes     ',                   style: TextStyle(color:Colors.grey) ),
                                              TextSpan(text:'${_posts[i].comments.length}  ',  style: TextStyle(color:Colors.black,fontWeight: FontWeight.bold) ),
                                              TextSpan(text:'Comments    ',                    style: TextStyle(color:Colors.grey) ),
                                              TextSpan(text:'${_posts[i].shares}  ',           style: TextStyle(color:Colors.black,fontWeight: FontWeight.bold) ),
                                              TextSpan(text:'Shares    ',                      style: TextStyle(color:Colors.grey) ),
                                            ],
                                            style: TextStyle(fontSize: 16)
                                            ),
                                          ),
                                          Divider(height: 40,thickness: 1,color:Colors.white,indent:0),


                                          ..._posts[i].comments.values.map( (e) => myComment(e,context) ) .toList(),

                                        ],),
                                    );

                                }),
                             )
                            )
                          ]),

                          SizedBox(height:30),
                          Text(_posts[i].text + '\n',style:TextStyle(
                            fontSize: 30,fontWeight: FontWeight.bold,color:Colors.white,height: 1.6),textAlign: TextAlign.center,
                          ),

                          Align(alignment:Alignment.topLeft,child: Text('${_posts[i].date.hour}:${_posts[i].date.minute} . ${_posts[i].date.day} / ${_posts[i].date.month} / ${_posts[i].date.year}' ,style: TextStyle(color:Colors.grey[400]),) ),
                          Divider(height: 40,thickness: 1,color:Colors.white,indent:0),
                          //Text(_posts[i].likes.toString()     + ' Likes'),
                          //Text(_posts[i].disLikes.toString()  + ' dislikes\n'),
                          
                          RichText(
                            textAlign: TextAlign.center,
                            text:TextSpan(children: [
                              TextSpan(text:'${_posts[i].likes}  ',            style: TextStyle(color:Colors.black,fontWeight: FontWeight.bold) ),
                              TextSpan(text:'Likes    ',                       style: TextStyle(color:Colors.grey) ),
                              TextSpan(text:'${_posts[i].disLikes}  ',         style: TextStyle(color:Colors.black,fontWeight: FontWeight.bold) ),
                              TextSpan(text:'dislikes     ',                   style: TextStyle(color:Colors.grey) ),
                              TextSpan(text:'${_posts[i].comments.length}  ',  style: TextStyle(color:Colors.black,fontWeight: FontWeight.bold) ),
                              TextSpan(text:'Comments    ',                    style: TextStyle(color:Colors.grey) ),
                              TextSpan(text:'${_posts[i].shares}  ',           style: TextStyle(color:Colors.black,fontWeight: FontWeight.bold) ),
                              TextSpan(text:'Shares    ',                      style: TextStyle(color:Colors.grey) ),
                            ],
                            style: TextStyle(fontSize: 16)
                            ),
                          ),

                          Divider(height: 40,thickness: 1,color:Colors.white,indent:0),
                          Row(mainAxisAlignment:MainAxisAlignment.spaceEvenly,children: [

                            InkWell(
                              child:Icon(Icons.favorite,          size: 30, color:Colors.red[800] ),
                              onTap: (){} 
                            ),
                            InkWell(
                              child:Icon(Icons.favorite_outline,  size: 30, color:Colors.grey[400] ),
                              onTap: (){} 
                            ),
                            InkWell(
                              child:Icon(Icons.comment,           size: 30, color:Colors.grey[400] ),
                              onTap: (){} 
                            ),
                            InkWell(
                              child:Icon(Icons.share,             size: 30, color:Colors.grey[400] ),
                              onTap: (){} 
                            ),
                            InkWell(
                              child:Icon(Icons.report,            size: 30, color:Colors.black87),
                              onTap: (){} 
                            ),

                          ],),



                          /*
                          ListView.builder(
shrinkWrap: true,
                            itemCount: _currentPostComments.length,
                            itemBuilder: (ctx,j){

                              return Container( height:100 ,child: Text('The ${j+1} Comment is ' + _currentPostComments[j].text));

                            },
                          )*/                  

                          
                        ]),
                      );

            },
            childCount: _posts.length,
          ),
        );

  }


}