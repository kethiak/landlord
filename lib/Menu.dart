import 'package:flutter/material.dart';

import 'Repair.dart';
import 'houselistView.dart';

class MYAPP extends StatefulWidget {
  const MYAPP({Key key}) : super(key: key);

  @override
  _MYAPPState createState() => _MYAPPState();
}

class _MYAPPState extends State<MYAPP> {
  Widget mainWidget = houselist();
  // ADD THIS HERE

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Side Menu Bar",
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Side Menu"),
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("kelly Kethia"),
              accountEmail: Text("Kellyingabire2016@gmail.com"),
              currentAccountPicture: CircleAvatar(
                child: Image.asset('images/view.jpeg'),
              ),
            ),
            ListTile(
              leading: Icon(Icons.apartment),
              title: Text("Properties"),
              onTap: () async {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => houselist()));
              },
            ),
            ListTile(
              leading: Icon(Icons.details),
              title: Text("Tenant Details"),
            ),
            ListTile(
              leading: Icon(Icons.payment),
              title: Text("Rental Payment"),
            ),
            ListTile(
              leading: Icon(Icons.inbox),
              title: Text("Primary"),
            ),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text("Repair"),
              onTap: () async {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => repair()));
              },
            ),
            ListTile(
              leading: Icon(Icons.supervised_user_circle),
              title: Text("Visitors"),
            ),
            Divider(),
            Expanded(
                child: Align(
              alignment: Alignment.topLeft,
              child: ListTile(
                leading: Icon(Icons.settings),
                title: Text("Settings"),
              ),
            )),
          ],
        ),
      ),
    );
  }
}

class BizCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tenant"),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[_getCard(), _getAvatar()],
        ),
      ),
    );
  }

  Widget _getCard() {
    return Container(
      width: 350,
      height: 200,
      margin: EdgeInsets.all(51.0),
      decoration: BoxDecoration(
          color: Colors.orangeAccent,
          borderRadius: BorderRadius.circular(14.5)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Ulrich Gashaka",
            style: TextStyle(
                fontSize: 20.9,
                color: Colors.white,
                fontWeight: FontWeight.w500),
          ),
          Text("Ulrichgashaka21@gmail.com"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.person_outline),
              Text("T: @caringthevaluesforfutures")
            ],
          )
        ],
      ),
    );
  }

  Container _getAvatar() {
    return Container(
      width: 111,
      height: 111,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
          border: Border.all(color: Colors.redAccent, width: 1.2),
          image: DecorationImage(
              image: NetworkImage("https://picsum.photos/200/300"),
              fit: BoxFit.cover)),
    );
  }
}
