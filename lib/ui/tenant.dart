import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';

class Tenant extends StatefulWidget {
  const Tenant({Key key}) : super(key: key);

  @override
  _TenantState createState() => _TenantState();
}

class _TenantState extends State<Tenant> {
  //text field state
  String Title = '';
  String FirstName = '';
  String LastName = '';
  String Type = '';
  String Email = '';
  String Phone = '';
  String Notes = '';
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: new AppBar(
        backgroundColor: Color(0xFFf4ae95),
        title: new Text('Add Tenant'),
        centerTitle: true,
        elevation: 0,
        actions: <Widget>[
          FlatButton.icon(
              icon: Icon(Icons.save, color: Color(0xFFFFFFFF)),
              label: Text('Save'),
              onPressed: () {}),
        ],
      ),
      body: SafeArea(
        child: ListView(children: <Widget>[
          new Container(
            width: 100,
            child: new Container(
              color: Color(0xFFFFFFFF),
              child: CircleAvatar(
                radius: 56,
                backgroundImage: AssetImage(
                  'images/image1.jpeg',
                ),
                child: Positioned(
                  right: -0,
                  bottom: 0,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 12.0,
                    child: Icon(
                      Icons.camera_alt,
                      size: 15.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
          TextFormField(
              decoration: InputDecoration(
                labelText: 'Title',
                filled: true,
              ),
              validator: (val) => val.isEmpty ? 'Title' : null,
              onChanged: (val) {
                setState(() => Title = val);
              }),
          TextFormField(
              decoration: InputDecoration(
                labelText: 'First Name',
                filled: true,
              ),
              validator: (val) => val.isEmpty ? 'Enter your First Name' : null,
              onChanged: (val) {
                setState(() => FirstName = val);
              }),
          TextFormField(
              decoration: InputDecoration(
                labelText: 'Last Name',
                filled: true,
              ),
              validator: (val) => val.isEmpty ? 'Enter your Last Name' : null,
              onChanged: (val) {
                setState(() => LastName = val);
              }),
          TextFormField(
              decoration: InputDecoration(
                labelText: 'Type',
                filled: true,
              ),
              validator: (val) => val.isEmpty ? 'Enter Owner' : null,
              onChanged: (val) {
                setState(() => Type = val);
                TextButton(
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(16.2),
                    primary: Colors.white,
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: () {},
                  child: const Text('Person'),
                );
                TextButton(
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(16.2),
                    primary: Colors.white,
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: () {},
                  child: const Text('Company'),
                );
              }),
          SizedBox(height: 10.0),
          TextFormField(
              decoration: InputDecoration(
                labelText: 'email',
                filled: true,
              ),
              validator: (val) => val.isEmpty ? 'Enter an email' : null,
              onChanged: (val) {
                setState(() => Email = val);
              }),
          SizedBox(height: 10.0),
          TextFormField(
              decoration: InputDecoration(
                labelText: 'Phone',
                filled: true,
              ),
              onChanged: (val) {
                setState(() => Phone = val);
              }),
          TextFormField(
              decoration: InputDecoration(
                labelText: 'Notes',
                filled: true,
              ),
              validator: (val) => val.isEmpty ? 'Enter About me' : null,
              onChanged: (val) {
                setState(() => Notes = val);
              }),
          TextButton(
            style: TextButton.styleFrom(
              padding: const EdgeInsets.all(16.2),
              primary: Colors.white,
              textStyle: const TextStyle(fontSize: 20),
            ),
            onPressed: () {},
            child: const Text('Get started'),
          )
        ]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.black,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.search), title: Text('Search')),
          BottomNavigationBarItem(
              icon: Icon(Icons.access_alarms), title: Text('Appointments')),
          BottomNavigationBarItem(
              icon: Icon(Icons.explore), title: Text('Explore')),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), title: Text('Profile')),
        ],
        currentIndex: selectedIndex,
        fixedColor: Colors.blue,
        onTap: onItemTapped,
      ),
    );
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
