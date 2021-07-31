import 'package:flutter/material.dart';

import 'loginpage.dart';

class Register extends StatefulWidget {
  const Register({Key key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();


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
                  validator: (val) =>
                      val.isEmpty ? 'Enter your First Name' : null,
                  onChanged: (val) {
                    setState(() => FirstName = val);
                  }),
              TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Last Name',
                    filled: true,
                  ),
                  validator: (val) =>
                      val.isEmpty ? 'Enter your Last Name' : null,
                  onChanged: (val) {
                    setState(() => LastName = val);
                  }),
              SizedBox(height: 10.0),
              TextFormField(
                  decoration: InputDecoration(
                    labelText: 'email',
                    filled: true,
                  ),
                  validator: (val) => val.isEmpty ? 'Enter an email' : null,
                  onChanged: (val) {
                    setState(() => email = val);
                  }),
              SizedBox(height: 10.0),
              TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                    filled: true,
                  ),
                  obscureText: true,
                  validator: (val) =>
                      val.length < 6 ? 'Enter a password 6+ chars long' : null,
                  onChanged: (val) {
                    setState(() => password = val);
                  }),
              ButtonBar(
                children: <Widget>[
                  FlatButton(
                    child: Text('CANCEL'),
                    onPressed: () {},
                  ),
                  RaisedButton(
                      color: Colors.orangeAccent,
                      child: Text('Register'),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          print(email);
                          print(password);
                        }
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
