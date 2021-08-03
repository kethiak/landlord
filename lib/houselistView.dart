import 'dart:convert';
import 'dart:io'as Io;
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:landlord/rental%20payment.dart';


import 'Menu.dart';
import 'Repair.dart';
import 'houselistdetails.dart';
import 'loginpage.dart';


class houselist extends StatefulWidget{
  @override

  HouseListView createState() => HouseListView();

}

class HouseListView extends  State<houselist> {
var Requestdata;
  final List houses = [
    {"name": "Villas Cancun", "image": "images/image1.jpeg" ,
      "description":"maison de 4 ares-trois chambres-2 sanitaires",
      "rent-per-month":"800 dollars",
      "location":"bujumbura-muha-Gihosha-Avenue nkondo-numero 30",
      "numero":"5948-345/383"



    },
    {"name": "Appartment Zenobe A", "image": "images/Appartment Zenobe A.jpeg","description":"",
      "description":"maison de 4 ares-trois chambres-2 sanitaires",
      "rent-per-month":"400 dollars",
      "location":"bujumbura-muha-Gihosha-Avenue nkondo-numero 30",
      "numero":"2747-904/575"
    },
    {"name": "Blue House", "image": "images/Blue House.jpeg",
      "description":"maison de 4 ares-trois chambres-2 sanitaires",
      "rent-per-month":"300 dollars",
      "location":"bujumbura-muha-Gihosha-Avenue nkondo-numero 30"},
    {"name": "Viking Appartment", "image": "images/Viking Appartment.jpeg",
      "description":"maison de 4 ares-trois chambres-2 sanitaires",
      "rent-per-month":"700 dollars",
      "location":"bujumbura-muha-Gihosha-Avenue nkondo-numero 30",
      "numero":"35348-3447/43"
    },
    {"name": "White House", "image": "images/White House.jpeg",
      "description":"maison de 4 ares-trois chambres-2 sanitaires",
      "rent-per-month":"900 dollars",
      "location":"bujumbura-muha-Gihosha-Avenue nkondo-numero 30",
      "numero":"2453-332/23"
    },
    {"name": "Studio D", "image": "images/Studio D.jpeg",
      "description":"maison de 4 ares-trois chambres-2 sanitaires",
      "rent-per-month":"350 dollars",
      "location":"bujumbura-muha-Gihosha-Avenue nkondo-numero 30",
      "numero":"5763-356/453"
    },
    {"name": "Champ Elysee", "image": "images/Champ Elysee.jpeg",
      "description":"maison de 4 ares-trois chambres-2 sanitaires",
      "rent-per-month":"1200 dollars",
      "location":"bujumbura-muha-Gihosha-Avenue nkondo-numero 30"
    }
  ];
  CollectionReference _collectionRef =
  FirebaseFirestore.instance.collection('collection');
  void getdocs(){
    // Future getDocs() async {
    //   QuerySnapshot querySnapshot = await Firestore.instance.collection("collection").getDocuments();
    //   for (int i = 0; i < querySnapshot.documents.length; i++) {
    //     var a = querySnapshot.documents[i];
    //     print(a.documentID);
    //   }
    // }

    ///Get all data from the collection that you found working, without using deprecated methods.




  }
  List requestlist;
  var alldata;
  Future<void> getDatarequest() async {
    CollectionReference _collectionRef =
    FirebaseFirestore.instance.collection('request');
    // Get docs from collection reference
    QuerySnapshot querySnapshot = await _collectionRef.get();

    // Get data from docs and convert map to List
  alldata = querySnapshot.docs.map((doc) => doc.data()).toList();
    for (var i = 0; i < alldata.length; i++) {

 var image=      Image.network(alldata[i]['image']);
      print('image    ========= ${image}');
      //Uint8List bytes  =base64.decode(alldata[i]['image']);
      // var file = Io.File("decodedBezkoder.png");
      // file.writeAsBytesSync(bytes);
      // print('file  : ${bytes}');
      setState(() {
        requestlist=[
          {
            "clientname":alldata[i]['clientname'] ,
            "housename":alldata[i]['housename'],
            "image":'${Image.network(alldata[i]['image'])}'
          }
        ];
      });
    }
    //print(alldata[0]['clientname']);
  }
  var selectedIndex= 0;
  bool ishouse=true;
  bool isrequest=false;

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
              accountName: Text("Tenant Management System"),
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
      body:isrequest==true?requestdata(context): ListView.builder(
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HouseListViewDetails(
                              houseName: houses.elementAt(index)["name"],
                              houseImage: houses.elementAt(index)["image"],
                              houselocation: houses.elementAt(index)["location"],
                              housedescription: houses.elementAt(index)["description"],
                              houseRent: houses.elementAt(index)["rent-per-month"]
                          )));
                },
                //onTap: () => debugPrint ("House name: ${houses.elementAt(index)}"
              ),
            );
          }),
      bottomNavigationBar: BottomNavigationBar(

        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded), title: Text('home')),
          // BottomNavigationBarItem(
          //     icon: Icon(Icons.add), title: Text('add')),
          BottomNavigationBarItem(
              icon: Icon(Icons.contact_page), title: Text('Requests')

          ),
        ],
        currentIndex: selectedIndex,
        fixedColor: Colors.blue,

        onTap: (index){
          // ignore: unnecessary_statements
          print('selected index $index');
          if(index==1){
            setState(() {
              isrequest=true;
              ishouse=false;
            });
          }
          if(index==0){
            setState(() {
              isrequest=false;
              ishouse=true;
            });
          }

          getDatarequest();
        },


      ),
    );
  }
  Widget requestdata(BuildContext context){
    return new Container(
      color: Colors.white,
      child:  new ListView(
        children: [
          new Container(
              child: new Column(
                  children:alldata.map<Widget>(

                          (data) =>

                      new Column(
                        children: [
                          new ListTile(
                            leading:new CircleAvatar(
                             // backgroundImage: AssetImage('${houses.elementAt(index)["image"]}'),
                            ),
                            // RotatedBox(
                            //
                            //     quarterTurns: 4,
                            //     child: ClipRRect(
                            //       borderRadius:
                            //       BorderRadius.circular(10),
                            //       child: Image.network(data['image']),
                            //     )
                            // ),

                            title: new Text('${data['clientname']}'),
                            subtitle: new Text('${data['housename']}'),
                          ),
                          new Divider(
                            height: 2,
                          ),
                        ],
                      )
                  ).toList())
          )

        ],
      ),
    );
  }
  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
      print('index $selectedIndex');
    });
  }
}


//New route (screen or page)

