import '../exporter.dart';

class Add extends StatefulWidget {
  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
  var name = 'wait';
  var phone = 'wait';
  var home = 'wait';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Text(name + phone.toString()),
        TextField(
          keyboardType: TextInputType.text,
          onChanged: (String value) {
            name = value;
          },
          onSubmitted: (value) {
            name = 'submitted';
            setState(() {});
          },
        ),
        TextField(
          keyboardType: TextInputType.number,
          onChanged: (String value) {
            phone = value;
          },
          onSubmitted: (value) {
            name = 'submitted';
            setState(() {});
          },
        ),
        TextField(
          keyboardType: TextInputType.number,
          onChanged: (String value) {
            home = 'OnChanged';
          },
          onSubmitted: (value) {
            home = 'OnSubmitted';
            setState(() {});
          },
        ),
        RaisedButton(
            child: Text('Add Phone $phone'),
            onPressed: () {

              Provider.of<PeopleModel>( context, listen: false ).addPeople(
                    id: 99,
                    image: AssetImage('assets/model.jpg'),
                    name: name,
                    description: 'Description' ,
                    phone: 404,
                    home: home,
              );
            Navigator.pop(context);

            }),
      ],
    ));
  }
}
