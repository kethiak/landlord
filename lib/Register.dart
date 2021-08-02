import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'loginpage.dart';

class Register extends StatefulWidget {
  const Register({Key key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  // void initializeFlutterFire() async {
  //   try {
  //     // Wait for Firebase to initialize and set `_initialized` state to true
  //     await Firebase.initializeApp();
  //     setState(() {
  //       _initialized = true;
  //     });
  //   } catch(e) {
  //     // Set `_error` state to true if Firebase initialization fails
  //     setState(() {
  //       _error = true;
  //     });
  //   }
  // }
  TextEditingController name=new TextEditingController();
  TextEditingController lastname=new TextEditingController();
  TextEditingController mail=new TextEditingController();
  TextEditingController pass=new TextEditingController();
  void _register() async {
    await Firebase.initializeApp();
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    try {
      await firestore.collection('users').add({
        "name":"${name.text}",
        "lastname":"${lastname.text}",
      " mail": "${mail.text}",
       "pass": "${pass.text}",
      });
      print('nice !!! data saved');
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => LoginPage()));
    } catch (e) {
      print(e);
      print('erroor!!!!');
    }
  }
  //text field state
  String email = '';
  String password = '';
  String FirstName = '';
  String LastName = '';



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.blueGrey,
        title: new Text('REGISTRER'),
        actions: <Widget>[
          FlatButton.icon(
              icon: Icon(Icons.person, color: Colors.orangeAccent),
              label: Text('login in here!'),
              onPressed: () async {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              }),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              Text(
                'Sign up Form',
                textAlign: TextAlign.center,
                style: new TextStyle(color: Colors.blueGrey, fontSize: 20),
              ),
              TextFormField(
                  decoration: InputDecoration(
                    labelText: 'First Name',
                    filled: true,
                  ),
                  controller: name,
                  //validator: (val) =>
                  //    val.isEmpty ? 'Enter your First Name' : null,


                  onChanged: (val) {
                    setState(() => FirstName = val);
                  }),
              TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Last Name',
                    filled: true,
                  ),
                  controller: lastname,
                  //validator: (val) =>
                //      val.isEmpty ? 'Enter your Last Name' : null,
                  onChanged: (val) {
                    setState(() => LastName = val);
                  }),
              SizedBox(height: 10.0),
              TextFormField(
                  decoration: InputDecoration(
                    labelText: 'email',
                    filled: true,
                  ),
                  controller: mail,
              //    validator: (val) => val.isEmpty ? 'Enter an email' : null,
                  onChanged: (val) {
                    setState(() => email = val);
                  }),
              SizedBox(height: 10.0),
              TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                    filled: true,
                  ),
                  controller: pass,
                  obscureText: true,
                  //validator: (val) =>
                    //  val.length < 6 ? 'Enter a password 6+ chars long' : null,
                  onChanged: (val) {
                    setState(() => password = val);
                  }),
              ButtonBar(
                children: <Widget>[
                  FlatButton(
                    child: Text('CANCEL'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  RaisedButton(
                      color: Colors.orangeAccent,
                      child: Text('Register'),
                      onPressed: () async {
                        _register();
                        // if (_formKey.currentState.validate()) {
                        //   print(email);
                        //   print(password);
                        // }
                      })
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
