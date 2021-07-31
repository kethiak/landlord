import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:landlord/picker.dart';


class repair extends StatelessWidget {
  const repair({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Report Repair Form',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: REPORT(),
    );
  }
}

enum Interest {
  LivingRoom,
  Kitchen,
  Bedroom,
  Bathroom,
  other,
  immediate,
  soon,
  Noturgent
}

class SignupUser {
  String name;
  String House;
  List<Interest> interests;
  bool ethicsAgreement;

  SignupUser({
    this.name,
    this.House,
    List<Interest> interests,
    this.ethicsAgreement = false,
  }) {
    this.interests = interests ?? [];
  }
  Map<String, dynamic> toJson() => {
        'name': name,
        'House': House,
        'interests': interests.toString(),
        'ethicsAgreement': ethicsAgreement,
      };
}

class REPORT extends StatefulWidget {
  const REPORT({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _REPORTState createState() => _REPORTState();
}

class _REPORTState extends State<REPORT> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _formResult = SignupUser();

  final nameFocusNode = FocusNode();
  final HouseFocusNode = FocusNode();
  final interestsFocusNode = FocusNode();
  final ethicsAgreementFocusNode = FocusNode();
  bool _checked = false;
  bool _checked1 = false;
  bool _checked2 = false;
  bool _checked3 = false;
  bool _checked4 = false;
  bool _checked5 = false;
  bool _checked6 = false;
  bool _checked7 = false;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Repair Form'),
      ),
      body: SafeArea(
        top: false,
        bottom: false,
        child: Form(
          key: _formKey,
          autovalidate: false,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Enter your name',
                  labelText: 'Name',
                ),
                inputFormatters: [LengthLimitingTextInputFormatter(30)],
                initialValue: _formResult.name,
                validator: (userName) {
                  if (userName.isEmpty) {
                    return 'Name is required';
                  }
                  if (userName.length < 3) {
                    return 'Name is too short';
                  }
                  return null;
                },
                onSaved: (userName) {
                  _formResult.name = userName;
                },
                autofocus: true,
                focusNode: nameFocusNode,
                textInputAction: TextInputAction.next,
                onTap: () {
                  FocusScope.of(context).unfocus();
                  FocusScope.of(context).requestFocus(nameFocusNode);
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Enter your house',
                  labelText: 'House',
                ),
                inputFormatters: [LengthLimitingTextInputFormatter(30)],
                initialValue: _formResult.name,
                validator: (userHouse) {
                  if (userHouse.isEmpty) {
                    return 'House is required';
                  }
                  if (userHouse.length < 3) {
                    return 'House is too short';
                  }
                  return null;
                },
                onSaved: (userHouse) {
                  _formResult.House = userHouse;
                },
                autofocus: true,
                focusNode: HouseFocusNode,
                textInputAction: TextInputAction.next,
                onTap: () {
                  FocusScope.of(context).unfocus();
                  FocusScope.of(context).requestFocus(HouseFocusNode);
                },
              ),
              CheckboxListTile(
                title: Text("Living Room"),
                secondary: Icon(Icons.meeting_room),
                controlAffinity: ListTileControlAffinity.platform,
                value: _checked,
                onChanged: (bool value) {
                  setState(() {
                    _checked = value;
                  });
                },
                activeColor: Colors.lightGreen,
                checkColor: Colors.black,
              ),
              CheckboxListTile(
                title: Text("Kitchen"),
                secondary: Icon(Icons.kitchen),
                controlAffinity: ListTileControlAffinity.platform,
                value: _checked1,
                onChanged: (bool value) {
                  setState(() {
                    _checked1 = value;
                  });
                },
                activeColor: Colors.lightGreen,
                checkColor: Colors.black,
              ),
              CheckboxListTile(
                title: Text("Bedroom"),
                secondary: Icon(Icons.king_bed),
                controlAffinity: ListTileControlAffinity.platform,
                value: _checked2,
                onChanged: (bool value) {
                  setState(() {
                    _checked2 = value;
                  });
                },
                activeColor: Colors.lightGreen,
                checkColor: Colors.black,
              ),
              CheckboxListTile(
                title: Text(" Bathroom"),
                secondary: Icon(Icons.wc),
                controlAffinity: ListTileControlAffinity.platform,
                value: _checked3,
                onChanged: (bool value) {
                  setState(() {
                    _checked3 = value;
                  });
                },
                activeColor: Colors.lightGreen,
                checkColor: Colors.black,
              ),
              CheckboxListTile(
                title: Text("others"),
                secondary: Icon(Icons.devices_other),
                controlAffinity: ListTileControlAffinity.platform,
                value: _checked4,
                onChanged: (bool value) {
                  setState(() {
                    _checked4 = value;
                  });
                },
                activeColor: Colors.lightGreen,
                checkColor: Colors.black,
              ),
              new Text("How urgent is this"),
              CheckboxListTile(
                title: Text(" immediate"),
                controlAffinity: ListTileControlAffinity.platform,
                value: _checked5,
                onChanged: (bool value) {
                  setState(() {
                    _checked5 = value;
                  });
                },
                activeColor: Colors.lightGreen,
                checkColor: Colors.black,
              ),
              CheckboxListTile(
                title: Text("Soon"),
                controlAffinity: ListTileControlAffinity.platform,
                value: _checked6,
                onChanged: (bool value) {
                  setState(() {
                    _checked6 = value;
                  });
                },
                activeColor: Colors.lightGreen,
                checkColor: Colors.black,
              ),
              CheckboxListTile(
                title: Text(" Not urgent"),
                controlAffinity: ListTileControlAffinity.platform,
                value: _checked7,
                onChanged: (bool value) {
                  setState(() {
                    _checked7 = value;
                  });
                },
                activeColor: Colors.blueGrey,
                checkColor: Colors.black,
              ),
              ListTile(
                leading: Text('Image P'),
                trailing: Icon(Icons.image),
                onTap: () async {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyHomePicker()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
