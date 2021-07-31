import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:landlord/ui/tenant.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Register.dart';
import 'houselistView.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}
class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text field state
  TextEditingController email =new TextEditingController();
  TextEditingController password  =new TextEditingController();

    final FirebaseFirestore firestore = FirebaseFirestore.instance;
  bool _initialized = false;
  bool _error = false;
var vraimail;
var vraipass;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
void checkcredentials(){
  if(email.text!=vraimail || password.text!=vraipass){



      _scaffoldKey.currentState.showSnackBar(new SnackBar(content: new Text('votre mot de pass ou email t incorect')));


  }else{
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => houselist()));
  }

}
  // Define an async function to initialize FlutterFire
  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch(e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _error = true;
      });
    }
  }
  @override
  //  initState() async {
  //   super.initState();
  //  // WidgetsFlutterBinding.ensureInitialized();
  //   //await Firebase.initializeApp();
  //   //
  // }
var data;
  void _create() async {
    try {
      await firestore.collection('users').doc('tenant').set({
        'mail': 'kelly',
        'pass': 'k1235',
      });
    } catch (e) {
      print(e);
    }
  }
  void _read() async {
    DocumentSnapshot documentSnapshot;
    try {
      documentSnapshot = await   firestore.collection('users').doc('tenant').get();
      print('users=======${documentSnapshot.data()}');
      setState(() {
        data=documentSnapshot.data();
            vraimail=data['mail'];
            vraipass=data['pass'];
      });
      print('data======${data}');
      print('mail======${vraimail}');
      print('pass=====${vraipass}');
      checkcredentials();
    } catch (e) {
      print(e);
    }
  }

  bool isobscur = true;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        key:_scaffoldKey,
      appBar: new AppBar(
        backgroundColor: Color(0xff8FB1CC),
        title: new Text(''),
        actions: <Widget>[],
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            SizedBox(height: 80.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('images/dream.jpg'),
                SizedBox(height: 20.0),
                Text(
                  'KDK LANDLORD LOGIN',
                ),
              ],
            ),
            SizedBox(height: 12.0),
            TextFormField(
                decoration: InputDecoration(
                  labelText: 'email',
                  filled: true,
                ),
                validator: (val) => val.isEmpty ? 'Enter an email' : null,
              controller: email,
              ),
            SizedBox(height: 10.0),
            TextFormField(
                decoration: InputDecoration(
                  suffixIcon: new IconButton(
                      onPressed: () {
                        setState(() {
                          isobscur = !isobscur;
                        });
                      },
                      icon: isobscur
                          ? new Icon(LineAwesomeIcons.eye)
                          : new Icon(LineAwesomeIcons.eye_slash)),
                  labelText: 'Password',
                  filled: true,
                ),
                obscureText: isobscur,
                validator: (val) =>
                    val.length < 6 ? 'Enter a password 6+ chars long' : null,
              controller: password,
                ),
            ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: Text('Log in'),
                  onPressed: () async {
                    await initializeFlutterFire();
                    _read();

                  },
                ),
              ],
            ),
            InkWell(
              child: new Center(
                child: Text(
                  "Don't have an account?",
                ),
              ),
              onTap: () async {
null;
                 //_create();
              },
            )
          ],
        ),
      ),


    );
  }

}




