import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:landlord/picker.dart';
import 'dart:io';

import 'houselistView.dart';


class repair extends StatelessWidget {
  const repair({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Report Repair Form',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
  var imageString;
  bool _checked = false;
  bool _checked1 = false;
  bool _checked2 = false;
  bool _checked3 = false;
  bool _checked4 = false;
  bool _checked5 = false;
  bool _checked6 = false;
  bool _checked7 = false;
  File _image;
  //var  pickedFile;
  final picker = ImagePicker();
  Future getImage() async {
  final  pickedFile= await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {

      setState(()  {
        _image = File(pickedFile.path);
        // List<int> imageBytes =
        // await pickedFile.readAsBytes();
        // imageString =
        //     base64Encode(imageBytes);
        // print(
        //     'image--------------------------------------------------------------$imageString');
      });
      setState(()  {
        _image = File(pickedFile.path);
        // List<int> imageBytes =
        // await pickedFile.readAsBytes();
        // imageString =
        //     base64Encode(imageBytes);
        // print(
        //     'image--------------------------------------------------------------$imageString');
      });
    } else {
      print('No image selected.');
    }
  }
  void _createrequest() async {
    var collection = FirebaseFirestore.instance.collection('request');
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    firestore.collection('request') // <-- Doc ID where data should be updated.
        .add(
        {
          'clientname': '${name.text}',
          'housename': '${house.text}',
          'living_room': '$_checked1',
          'kitchen': '$_checked2',
          'bed_room': '$_checked3',
          'bathroom': '$_checked4',
          'others':'$_checked1',
          'image':'$_image'
        }
        ) // <-- New data
        .then((_) => print('Updated'))
        .catchError((error) => print('Update failed: $error'));


    // final FirebaseFirestore firestore = FirebaseFirestore.instance;
    // try {
    //   await firestore.collection('request').doc('data').set({
    //     'clientname': '${name.text}',
    //     'housename': '${house.text}',
    //     'living_room': '$_checked1',
    //     'kitchen': '$_checked2',
    //     'bed_room': '$_checked3',
    //     'bathroom': '$_checked4',
    //     'others':'$_checked1',
    //     'image':'${imageString}'
    //   });
    // } catch (e) {
    //   print(e);
    // }
  }
TextEditingController name=new TextEditingController();
  TextEditingController house=new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        actions: [],
        title: Text('Repair Form'),
        centerTitle: true,

      ),
      backgroundColor: Colors.blue,
      body: SafeArea(

        top: false,
        bottom: false,
        child: Form(
          key: _formKey,
          autovalidate: false,
          child:new Card(

            child:  ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20),
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Enter your name',
                    labelText: 'Name',
                  ),
                  controller: name,
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
                  controller: house,
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
                  // activeColor: Colors.lightGreen,
                  // checkColor: Colors.black,
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
                  //activeColor: Colors.bllightGreen,
                 // checkColor: Colors.black,
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
                  // activeColor: Colors.lightGreen,
                  // checkColor: Colors.black,
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
                  // activeColor: Colors.lightGreen,
                  // checkColor: Colors.black,
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
                  // activeColor: Colors.lightGreen,
                  // checkColor: Colors.black,
                ),
                new Divider(height: 2,color: Colors.blue,),
                new Text("How urgent is this"),
                CheckboxListTile(
                  title: Text(" immediate"),
                  controlAffinity: ListTileControlAffinity.platform,
                  value: _checked5,
                  onChanged: (bool value) {
                    setState(() {
                      _checked5 = value;
                      _checked6=false;
                      _checked7=false;
                    });
                  },
                  // activeColor: Colors.lightGreen,
                  // checkColor: Colors.black,
                ),
                CheckboxListTile(
                  title: Text("Soon"),
                  controlAffinity: ListTileControlAffinity.platform,
                  value: _checked6,
                  onChanged: (bool value) {
                    setState(() {
                      _checked6 = value;
                      _checked5=false;
                      _checked7=false;

                    });
                  },
                  // activeColor: Colors.lightGreen,
                  // checkColor: Colors.black,
                ),
                CheckboxListTile(
                  title: Text(" Not urgent"),
                  controlAffinity: ListTileControlAffinity.platform,
                  value: _checked7,
                  onChanged: (bool value) {
                    setState(() {
                      _checked7 = value;
                      _checked5=false;
                      _checked6=false;
                    });
                  },
                  // activeColor: Colors.blueGrey,
                  // checkColor: Colors.black,
                ),
                ListTile(
                  leading: Text('Image P'),
                  trailing: Icon(Icons.image),
                  onTap: () async {
                  setState(() {
                    //pickedFile=null;
                    getImage();
                  });

                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => MyHomePicker()));
                  },
                ),
                Center(

                    child: new Container(

                      height: 300,
                      child: _image == null ? Text('No image selected.') : Image.file(_image),
                    ),


                ),
                new RaisedButton(
                  color: Colors.blue,
                    onPressed:(){
                      _createrequest();
                      showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                                contentPadding: EdgeInsets.only(top: 10.0),
                                //  title:  new Text('Achat des unites $biller_name',style: Style.globalQrCode,textAlign:TextAlign.center,),
                                elevation: 1,
                                content: new Container(
                                    height: 200,
                                    padding: EdgeInsets.all(20),
                                    //  padding: EdgeInsets.only(left: 10,right: 10),
//              color: Colors.black12,

                                    child:
                                    new ListView(
                                      children: [
                                   Text('Request sent successfuly!!!!',textAlign: TextAlign.center,
                                  style:new TextStyle(color: Colors.green)),
                                        new Icon(
                                          Icons.check,
                                          size: 50,
                                          color: Colors.green,
                                        ),
                                        new RaisedButton(
                                          color: Colors.green,
    onPressed: (){
    Navigator.pop(context);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>houselist()));
    },
       child: new Text('OK',style: new TextStyle(color: Colors.white),),

    )

                                      ],
                                    )
                                )
                            );
                          });
                    },
                  child: new Text('Send yor request',style: new TextStyle(color: Colors.white,fontSize: 14),),
                )
              ],
            ),
          )
        ),
      ),
    );
  }
}
