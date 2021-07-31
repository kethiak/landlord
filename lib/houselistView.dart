import 'package:flutter/material.dart';
import 'package:landlord/rental%20payment.dart';


import 'Menu.dart';
import 'Repair.dart';
import 'loginpage.dart';

class MYAPP extends StatefulWidget {
  const MYAPP({Key key}) : super(key: key);

  @override
  _MYAPPState createState() => _MYAPPState();
}

class _MYAPPState extends State<MYAPP> {

  // ADD THIS HERE

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Side Menu Bar",
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: houselist(),
    );
  }
}
class houselist extends StatefulWidget{
  @override

  HouseListView createState() => HouseListView();

}
class HouseListView extends  State<houselist> {
  final List houses = [
    {"name": "Villas Cancun", "image": "images/image1.jpeg"},
    {"name": "Appartment Zenobe A", "image": "images/Appartment Zenobe A.jpeg"},
    {"name": "Blue House", "image": "images/Blue House.jpeg"},
    {"name": "Viking Appartment", "image": "images/Viking Appartment.jpeg"},
    {"name": "White House", "image": "images/White House.jpeg"},
    {"name": "Studio D", "image": "images/Studio D.jpeg"},
    {"name": "Champ Elysee", "image": "images/Champ Elysee.jpeg"}
  ];
  var selectedIndex= 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Houses"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      drawer: new Drawer(
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Landlord Management System"),
              accountEmail: Text("Kellyingabire2016@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("assets/images/view.jpeg"),
              ),
            ),
            ListTile(
              leading: Icon(Icons.apartment),
              title: Text("Properties"),
              onTap: () {
               null;
              },
            ),
            ListTile(
              leading: Icon(Icons.details),
              title: Text("Tenant Details"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BizCard()));
              },
            ),
            ListTile(
              leading: Icon(Icons.payment),
              title: Text("Rental Payment"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BillSplitter()));
              },
            ),
            ListTile(
              leading: Icon(Icons.inbox),
              title: Text("Primary"),
            ),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text("Repair"),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => REPORT()));
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
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Logout"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
            ),
          ],
        ),
      ),
      backgroundColor: Colors.blueGrey.shade400,
      body: ListView.builder(
          itemCount: houses.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              elevation: 4.5,
              color: Colors.white,
              child: ListTile(
                leading: CircleAvatar(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(13.9)),
                    child: Image.asset('images/dream.jpg'),
                  ),
                ),
                trailing: Text(("...")),
                title: Text(houses[index]["name"]),
                subtitle: Text("Sub"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HouseListViewDetails(
                              houseName: houses.elementAt(index)["name"],
                              houseImage: houses.elementAt(index)["image"])));
                },
                //onTap: () => debugPrint ("House name: ${houses.elementAt(index)}"
              ),
            );
          }),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.black,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded), title: Text('home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.add), title: Text('add')),

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


//New route (screen or page)
class HouseListViewDetails extends StatelessWidget {
  final String houseName;
  final String houseImage;

  const HouseListViewDetails({Key key, this.houseName, this.houseImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Houses "),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      body: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              Image.asset(
                this.houseImage,
                width: 259,
                height: 189,
              ),
              RaisedButton(
                  child: Text("Go back ${this.houseName}"),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
