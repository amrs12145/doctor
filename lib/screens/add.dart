import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../exporter.dart';

class Add extends StatelessWidget {

  final websiteController = TextEditingController();
  final workController = TextEditingController();
  final liveController = TextEditingController();
  final bornController = TextEditingController();
  final successController = TextEditingController();
  final bioController = TextEditingController();
  final tagController = TextEditingController();
  final List<String> tags=[];
  String _degree;

  final User user = FirebaseAuth.instance.currentUser;

  Future<void> setup() async
  {
    DocumentSnapshot<Map<String, dynamic>> data = await FirebaseFirestore.instance.collection('users/'+user.uid+'/details').doc(user.uid).get();
    websiteController.text = data.data()['website'];
    workController.text = data.data()['work_in'];
    liveController.text = data.data()['live_in'];
    bornController.text = data.data()['born_in'];
    successController.text = data.data()['success'];
    bioController.text = data.data()['bio'];
    _degree = data.data()['degree'];
    tags.clear();
    tags.addAll(List.from(data.data()['tags']));
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      body: FutureBuilder(
        future: setup(),
        builder: (context, snapshot) => snapshot.connectionState != ConnectionState.done ? CircularProgressIndicator() :
        SingleChildScrollView(
          //padding: EdgeInsets.fromLTRB(8.0, 32.0, 8.0, 32.0),
          child:Column(children: [

            SizedBox(height:60),
            Icon(Icons.star),
            Text('Update Your Data',style:TextStyle(color:Colors.blue,fontSize:30)),
            Text(user.email),
            Text(tags.length.toString()),
            SizedBox(height:30),

            Container(
              padding: EdgeInsets.all(32.0),
              margin: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color:Colors.white,
                borderRadius: BorderRadius.circular(32.0),
              ),
              child:Form(
                child: Column(children: [

                  MyTextField( 'Website','Enter your Website',         Icon(Icons.link),                   websiteController ),
                  MyTextField( 'Work in','Enter your work location',   Icon(Icons.work),                   workController ),
                  MyTextField( 'Live in','Enter your recent location', Icon(Icons.location_on),            liveController ),
                  MyTextField( 'Born in','Enter your born location ',  Icon(Icons.home),                   bornController ),
                  MyTextField( 'Success','Enter your job success percentage', Icon(Icons.group),           successController ),
                  DropdownButtonFormField(
                    hint: Text('Your Degree'),
                    value: _degree,
                    decoration: InputDecoration(
                      icon: Icon(Icons.celebration),
                      contentPadding: EdgeInsets.all(22.0),
                      border: OutlineInputBorder()
                    ),
                    onChanged: (value) => _degree=value,
                    items: [
                      DropdownMenuItem(
                        value: 'none',
                        child:Text('None')
                      ),
                      DropdownMenuItem(
                        value: 'ba',
                        child:Text('Bachelor')
                      ),
                      DropdownMenuItem(
                        value: 'ma',
                        child:Text('Master\'s')
                      ),
                      DropdownMenuItem(
                        value: 'ph',
                        child:Text('Phd')
                      ),
                    ],
                  ),
                  SizedBox(height:25),
                  Padding(
                    padding: const EdgeInsets.only(bottom:26.0),
                    child: TextFormField(
                      maxLines: 10,
                      controller: bioController,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        icon: Icon(Icons.description_outlined),
                        contentPadding: EdgeInsets.all(22),
                        labelText: 'Bio',
                        hintText: 'Enter Your bio',
                        border: OutlineInputBorder()
                      ),
                    ),
                  ),
                  //MyTextField( 'Tags','Enter tags seperated by(\,)',  Icon(Icons.description_outlined),   bioController ),
                  MyTags(tagController,tags),

                  SizedBox(height:30.0),

                  ElevatedButton(
                    onPressed: (){
                      FirebaseFirestore.instance.collection('users/'+user.uid+'/details').doc(user.uid).set({
                        'website': websiteController.text,
                        'work_in': workController.text,
                        'live_in': liveController.text,
                        'born_in': bornController.text,
                        'degree' : _degree,
                        'success': successController.text,
                        'bio'    : bioController.text,
                        'tags'   : tags
                      }).then((_) => Navigator.pushReplacementNamed(context,Constants.homeScreen));
                    },
                    child: Text('Submit',style:TextStyle(fontSize:25)),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.fromLTRB(60.0, 16.0, 60.0, 16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22.0)
                      ),
                    ),
                  ),


                ]),
              )
            ),

          SizedBox(height:50),
          
          ],)
        ),
      )
    );
  }

}

class MyTextField extends StatelessWidget {

  final String _label;
  final String _hint;
  final Icon _icon;
  final _controller;
  const MyTextField(this._label,this._hint,this._icon,this._controller);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom:26.0),
      child: TextFormField(
        controller: _controller,
        //keyboardType: TextInputType.number,
        decoration: InputDecoration(
          icon: _icon,
          contentPadding: EdgeInsets.all(22),
          labelText: _label,
          hintText: _hint,
          border: OutlineInputBorder(
            
          )
        ),
      ),
    );
  }
}


class MyTags extends StatefulWidget {

  final TextEditingController tagController;
  final List<String> tags;
  MyTags(this.tagController,this.tags);

  @override
  _MyTagsState createState() => _MyTagsState();
}

class _MyTagsState extends State<MyTags> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [

            TextFormField(
              controller: widget.tagController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.all(22),
                labelText: 'Tags',
                hintText: 'Enter tags then click +',
                icon: Icon(Icons.description_outlined),
                suffixIcon: InkWell(
                  onTap: (){
                    setState((){
                      widget.tags.add(widget.tagController.text);
                      widget.tagController.clear();
                    });
                  },
                  child: Icon(Icons.add,size:30),
                ),
              ),
            ),

            Wrap(children: [
                ...widget.tags.map((e) => 
                                InkWell(
                                  onTap: () => setState( () => widget.tags.removeWhere((element)=>element==e) ),
                                  child: Container(
                                    child: Text(e,style:TextStyle(color:Colors.white)),
                                    padding: EdgeInsets.all(16.0),
                                    margin:  EdgeInsets.only(top:16.0,right: 16.0),
                                    decoration: BoxDecoration(
                                      color:Colors.blue,
                                    ),
                                  ),
                                )
                              ).toList(),
            ]), 

    ]);
  }
}