import 'package:flutter/foundation.dart';

class PeopleDetails
{
  int _followers,_following,_likes,_shots,_loved;
  String bio;

  PeopleDetails(this._followers,this._following,this._likes,this._shots,this._loved,{this.bio='Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.'});

}



class PeopleDetailsModel extends ChangeNotifier
{


  PeopleDetails getPeopleDetails(int id)
  {
    return _peopleDetails[id];
  }

  void addPeopleDetails(int id,int followers,int following,int likes,int shots,int loved,{String bio})
  {
    _peopleDetails.addAll(
      {
        id:PeopleDetails(followers,following,likes,shots,loved,bio: bio ?? 'it was null\ni\'m in line 42 details.dart page')
      }
    );

    notifyListeners();
  }
  void removePeopleDetails(int id)
  {
    //_peopleDetails.remove(id);
    _peopleDetails.removeWhere((key, value) => key==id);
    notifyListeners();
  }


  // GETTERS & SETTERS TO SUPER CLASS
  int getFollowers(int id) => getPeopleDetails(id)._followers;
  int getFollowing(int id) => getPeopleDetails(id)._following;
  int getLikes(int id)     => getPeopleDetails(id)._likes;
  int getShots(int id)     => getPeopleDetails(id)._shots;
  int getLoved(int id)     => getPeopleDetails(id)._loved;
  String getBio(int id)    => getPeopleDetails(id).bio;



  void setFollowers(int id , int followers)
  {
    getPeopleDetails(id)._followers = followers;
    notifyListeners();
  }

  void setFollowing(int id , int following)
  {
    getPeopleDetails(id)._following = following;
    notifyListeners();
  }

  void setLikes(int id , int likes)        
  {
    getPeopleDetails(id)._likes = likes;
    notifyListeners();
  }

  void setShots(int id , int shots)        
  {
    getPeopleDetails(id)._shots = shots;
    notifyListeners();
  }

  void setLoved(int id , int loved)        
  {
    getPeopleDetails(id)._loved = loved;
    notifyListeners();
  }






  Map<int,PeopleDetails> _peopleDetails = <int,PeopleDetails>{

    5  : PeopleDetails(2280,50,4913,200,19),
    10 : PeopleDetails(912,20,7410,21,120),
    4  : PeopleDetails(150,3350,2141,194,40),
    9  : PeopleDetails(100,20,1225,20,35),
    1  : PeopleDetails(4910,140,1224,660,124),
    6  : PeopleDetails(3491,76,1491,150,15),
    2  : PeopleDetails(43,3454,9542,321,9),
    8  : PeopleDetails(7644,88,3540,154,15),
    3  : PeopleDetails(2280,6420,3400,331,30),
    7  : PeopleDetails(1510,60,5501,350,160),

  };




}