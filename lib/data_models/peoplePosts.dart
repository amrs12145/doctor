import 'package:flutter/foundation.dart';

class Post
{
  int publisherId;
  int postId;
  String text;
  DateTime date;
  int likes,disLikes,shares;
  Map<int,Comment> comments;

  Post(this.publisherId,this.postId,this.text,this.date,this.likes,this.disLikes,this.shares,this.comments);
}

class Comment
{
  int commenterId;
  int commentId;
  int postId;
  String text;
  DateTime date;
  int likes,disLikes;

  Comment( this.commenterId,this.commentId,this.postId ,this.text,this.date,this.likes,this.disLikes);
}



class PostModel extends ChangeNotifier
{

  Map<int,Post> getPosts(int publisherId){
    return _posts[publisherId];
  }
  int getPostsLength(int publisherId){
    return _posts[publisherId].length;
  }

  void addPost( int publisherId , int postId, String text ,DateTime date, int likes , int disLikes , int shares)
  {

    if ( _posts[publisherId] != null )
    {
      _posts[publisherId].addAll({ postId : Post( publisherId,postId,text,date,likes,likes,shares,{} ) });
    }
    else
    {
      _posts.addAll({
        publisherId : { postId : Post( publisherId,postId,text,date,likes,likes,shares,{} ) }
      });
    }

    notifyListeners();
  }

  void removePost( int publisherId , int postId )
  {
    _posts[publisherId].remove(postId);
    notifyListeners();
  }


  void addComment( int commenterId , int commentId , int publisherId , int postId, String text , DateTime date , int likes ,int disLikes )
  {
   _posts[publisherId][postId].comments.addAll({ commentId : Comment(commenterId,commentId,postId ,text,date,likes,disLikes) });
    notifyListeners();
  }

  void removeComment(int commentId , int commenterId,int postId,int publisherId)
  {
    _posts[publisherId][postId].comments.remove(commentId);
    notifyListeners();
  }




  Map<int,Map<int,Post>> _posts = {
    5 :
      {
        1 : Post(5 , 1 ,'i\'m not felling Good right now! \n Can someone help.', DateTime(2021,7,15,1,43)  ,  6,1,3 ,  { 7 : Comment(1, 7 ,1,'I can happily help you.',DateTime.now(),1,0) ,  2 :    Comment(2, 2 ,1,'Gimme ur number for help.',DateTime.now(),0,9) , 3 : Comment(2, 3 ,1,'Gimme ur number for help.',DateTime.now(),0,9) , 40 : Comment(3, 40 ,1,'You will be okay.',DateTime.now(),1,0) }),/*secondPost => */
      },

    7 :
      {
        2 : Post(7 , 2 ,'i\'m not felling Good right now! \n Can someone help.', DateTime.now()            ,  6,1,3 ,  { 7 : Comment(1, 7 ,2,'I can happily help you.',DateTime.now(),1,0) ,  2 :    Comment(2, 2 ,2,'Gimme ur number for help.',DateTime.now(),0,9) , 3 : Comment(2, 3 ,2,'Gimme ur number for help.',DateTime.now(),0,9) , 40 : Comment(3, 40 ,2,'You will be okay.',DateTime.now(),1,0) }),/*secondPost => */
      },

    3 :
      {
        3 : Post(3 , 3 ,'i\'m not felling Good right now! \n Can someone help.', DateTime(2021,7,9,1,12)   ,  6,1,3 ,  { 7 : Comment(1, 7 ,3,'I can happily help you.',DateTime.now(),1,0) ,  2 :    Comment(2, 2 ,3,'Gimme ur number for help.',DateTime.now(),0,9) , 3 : Comment(2, 3 ,3,'Gimme ur number for help.',DateTime.now(),0,9) , 40 : Comment(3, 40 ,3,'You will be okay.',DateTime.now(),1,0) }),/*secondPost => */
      },

    1 :
      {
        4 : Post(1 , 4 ,'i\'m not felling Good right now! \n Can someone help.', DateTime(2021,7,12,1,16)  ,  6,1,3 ,  { 7 : Comment(1, 7 ,4,'I can happily help you.',DateTime.now(),1,0) ,  2 :    Comment(2, 2 ,4,'Gimme ur number for help.',DateTime.now(),0,9) , 3 : Comment(2, 3 ,4,'Gimme ur number for help.',DateTime.now(),0,9) , 40 : Comment(3, 40 ,4,'You will be okay.',DateTime.now(),1,0) }),/*secondPost => */
      },

    6 : 
      {
        5 : Post(6 , 5 ,'i\'m not felling Good right now! \n Can someone help.', DateTime(2021,7,11,1,21)  ,  6,1,3 ,  { 7 : Comment(1, 7 ,5,'I can happily help you.',DateTime.now(),1,0) ,  2 :    Comment(2, 2 ,5,'Gimme ur number for help.',DateTime.now(),0,9) , 3 : Comment(2, 3 ,5,'Gimme ur number for help.',DateTime.now(),0,9) , 40 : Comment(3, 40 ,5,'You will be okay.',DateTime.now(),1,0) }),/*secondPost => */
      },

    2 :
      {
        6 : Post(2 , 6 ,'i\'m not felling Good right now! \n Can someone help.', DateTime(2021,6,15,1,11)  ,  6,1,3 ,  { 7 : Comment(1, 7 ,6,'I can happily help you.',DateTime.now(),1,0) ,  2 :    Comment(2, 2 ,6,'Gimme ur number for help.',DateTime.now(),0,9) , 3 : Comment(2, 3 ,6,'Gimme ur number for help.',DateTime.now(),0,9) , 40 : Comment(3, 40 ,6,'You will be okay.',DateTime.now(),1,0) }),
        /*Second Post => */
        66 : Post(2 , 66 ,'i\'m not felling Good right now! \n Can someone help.', DateTime(2021,6,15,1,11)  ,  6,1,3 ,  { 7 : Comment(1, 7 ,6,'I can happily help you.',DateTime.now(),1,0) ,  2 :    Comment(2, 2 ,6,'Gimme ur number for help.',DateTime.now(),0,9) , 3 : Comment(2, 3 ,6,'Gimme ur number for help.',DateTime.now(),0,9) , 40 : Comment(3, 40 ,6,'You will be okay.',DateTime.now(),1,0) }),
        /*Third Post => */
        666 : Post(2 , 666 ,'i\'m not felling Good right now! \n Can someone help.', DateTime(2021,6,15,1,11)  ,  6,1,3 ,  { 7 : Comment(1, 7 ,6,'I can happily help you.',DateTime.now(),1,0) ,  2 :    Comment(2, 2 ,6,'Gimme ur number for help.',DateTime.now(),0,9) , 3 : Comment(2, 3 ,6,'Gimme ur number for help.',DateTime.now(),0,9) , 40 : Comment(3, 40 ,6,'You will be okay.',DateTime.now(),1,0) }),
      },

    4 :
      {
        7 : Post(4 , 7 ,'i\'m not felling Good right now! \n Can someone help.', DateTime(2021,1,1,1,50)   ,  6,1,3 ,  { 7 : Comment(1, 7 ,7,'I can happily help you.',DateTime.now(),1,0) ,  2 :    Comment(2, 2 ,7,'Gimme ur number for help.',DateTime.now(),0,9) , 3 : Comment(2, 3 ,7,'Gimme ur number for help.',DateTime.now(),0,9) , 40 : Comment(3, 40 ,7,'You will be okay.',DateTime.now(),1,0) }),/*secondPost => */ 
      },

  };



}