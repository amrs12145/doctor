
import 'package:flutter/foundation.dart';


class PeopleTags
{
  int peopleId;
  List<String> tags = [];

  PeopleTags({this.peopleId,this.tags});
  
}


class PeopleTagsModel extends ChangeNotifier
{
  
  PeopleTags getPeopleTags( int peopleId )
  {
    //return _peopleTags.where((element) => element.peopleId == peopleId ).toList()[0];
    List<PeopleTags> matchedResults = _peopleTags.where((element) => element.peopleId == peopleId ).toList();

    if( matchedResults.length != 1 )
      print('in PeopleTagsModel Class Error found no matched id or multiple id');

    return matchedResults[0];
  }


  void addPeopleTags(int peopleId ,List<String> tags)
  {
    _peopleTags.add(
      PeopleTags(peopleId: peopleId,tags:tags)
    );
    notifyListeners();
  }
  void addTags(int peopleId,List<String> tagsToBeAdded)
  {
    getPeopleTags( peopleId ).tags.addAll(tagsToBeAdded);
    notifyListeners();
  }
  /*
  void removeTags(int peopleId,List<String> tagsToBeRemoved)
  {
    tagsToBeRemoved.removeWhere((e) => e == getPeopleTags( peopleId ).tags.map((e) => e)  );

    getPeopleTags( peopleId ).tags.removeWhere((element) => tagsToBeRemoved. )
  }
*/
  void removePeopleTags(int peopleId)
  {
    _peopleTags.removeWhere((element) => element.peopleId == peopleId);
    notifyListeners();
  }




  List<PeopleTags> _peopleTags = [

    PeopleTags( peopleId:1 ,  tags:['Mobile Applications','Development','engineering','programming','Innovation','UX Design','UI Design','Flutter','Front-End Development','computerScience'] ),
    PeopleTags( peopleId:2 ,  tags:['programming','Development','engineering','FireBase','computerScience','UI Design','Flutter','programming','FireBase'] ),
    PeopleTags( peopleId:3 ,  tags:['programming','TRYYY','engineering','FireBase','computerScience','UI Design','Flutter','programming','FireBase'] ),
    PeopleTags( peopleId:4 ,  tags:['Mobile Applications','business','GlassDoor','computerScience','engineering','UX Design','Innovation','Flutter','Front-End Development','FireBase'] ),
    PeopleTags( peopleId:5 ,  tags:['Mobile Applications','Development','computerScience','Innovation','engineering','UX Design','UI Design','Flutter','Front-End Development','FireBase'] ),
    PeopleTags( peopleId:6 ,  tags:['computerScience','Development','programming','business','Innovation','UX Design','UI Design','Flutter','Front-End Development','engineering'] ),
    PeopleTags( peopleId:7 ,  tags:['computerScience','programming','GlassDoor','Free Chips','FireBase','UX Design','UI Design','Flutter','engineering','FireBase'] ),
    PeopleTags( peopleId:8 ,  tags:['programming','Development','Innovation','Free Chips','FireBase','business','UI Design','Flutter','Front-End Development','FireBase'] ),
    PeopleTags( peopleId:9 ,  tags:['Mobile Applications','Development','Innovation','Free Chips','FireBase','UX Design','UI Design','Flutter','business','FireBase'] ),
    PeopleTags( peopleId:10,  tags:['Innovation','computerScience','Innovation','Free Chips','programming','UX Design','UI Design','Flutter','Front-End Development','business'] ),
    
  ];
}