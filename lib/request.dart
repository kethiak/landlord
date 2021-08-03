import 'package:flutter/material.dart';
import 'package:landlord/rental%20payment.dart';


import 'Menu.dart';
import 'Repair.dart';
import 'houselistdetails.dart';
import 'loginpage.dart';


class requestlist extends StatefulWidget{
  @override

  request createState() => request();

}

class request extends  State<requestlist> {
  final List houses = [
    {"name": "Villas Cancun", "image": "images/image1.jpeg" ,
      "description":"maison de 4 ares-trois chambres-2 sanitaires",
      "location":"bujumbura-muha-Gihosha-Avenue nkondo-numero 30"},
    {"name": "Appartment Zenobe A", "image": "images/Appartment Zenobe A.jpeg","description":"",
      "description":"maison de 4 ares-trois chambres-2 sanitaires",
      "location":"bujumbura-muha-Gihosha-Avenue nkondo-numero 30"
    },
    {"name": "Blue House", "image": "images/Blue House.jpeg",
      "description":"maison de 4 ares-trois chambres-2 sanitaires",
      "location":"bujumbura-muha-Gihosha-Avenue nkondo-numero 30"},
    {"name": "Viking Appartment", "image": "images/Viking Appartment.jpeg",
      "description":"maison de 4 ares-trois chambres-2 sanitaires",
      "location":"bujumbura-muha-Gihosha-Avenue nkondo-numero 30"
    },
    {"name": "White House", "image": "images/White House.jpeg",
      "description":"maison de 4 ares-trois chambres-2 sanitaires",
      "location":"bujumbura-muha-Gihosha-Avenue nkondo-numero 30"
    },
    {"name": "Studio D", "image": "images/Studio D.jpeg",
      "description":"maison de 4 ares-trois chambres-2 sanitaires",
      "location":"bujumbura-muha-Gihosha-Avenue nkondo-numero 30"
    },
    {"name": "Champ Elysee", "image": "images/Champ Elysee.jpeg",
      "description":"maison de 4 ares-trois chambres-2 sanitaires",
      "location":"bujumbura-muha-Gihosha-Avenue nkondo-numero 30"
    }
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
      backgroundColor: Colors.blue,
      body: ListView.builder(
          itemCount: houses.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              elevation: 4.5,
              color: Colors.white,
              child: ListTile(
                leading:new CircleAvatar(

                  backgroundImage: AssetImage('${houses.elementAt(index)["image"]}'),
                ),
                // Container(
                //   decoration: BoxDecoration(
                //       color: Colors.blueGrey,
                //       borderRadius: BorderRadius.circular(10)),
                //   child: Image.asset('${houses.elementAt(index)["image"]}'),
                // ),
                trailing: Text(("...")),
                title: Text(houses[index]["name"]),
                // subtitle: Text("Sub"),
                onTap: () {
                null;
                },
                //onTap: () => debugPrint ("House name: ${houses.elementAt(index)}"
              ),
            );
          }),

    );
  }

}


//New route (screen or page)

