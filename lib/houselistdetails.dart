import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:landlord/rental%20payment.dart';

import 'Repair.dart';
class HouseListViewDetails extends StatelessWidget {
  final String houseName;
  final String houseImage;
  final String housedescription;
  final String houselocation;
  final String houseRent;
  const HouseListViewDetails({Key key, this.houseName, this.housedescription,this.houselocation,this.houseImage, this.houseRent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Houses Details"),
        automaticallyImplyLeading: true,
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Container(
          color: Colors.blue,
          padding: EdgeInsets.all(30),
          child: Column(
            children: <Widget>[
              RotatedBox(
                  quarterTurns: 4,
                  child: ClipRRect(
                    borderRadius:
                    BorderRadius.circular(10),
                    child:   Image.asset(
                      this.houseImage,
                    ),
                  )
              ),
           new Card(
             color: Colors.blue,
             child:    new ListTile(
               leading: new Text('Description :'),
               title: new Text('${this.housedescription}',style: new TextStyle(fontSize: 12,color: Colors.white),),
             ),
           ),
             new Card(
               color: Colors.blue,
               child:  new ListTile(
                 leading: new Text('Location :'),
                 title: new Text('${this.houselocation}',style: new TextStyle(fontSize: 12,color: Colors.white),
               ),
             )
             ),
              new Card(
                color: Colors.blue,
                child:    new ListTile(
                  leading: new Text('Rent :'),
                  title: new Text('${this.houseRent}',style: new TextStyle(fontSize: 12,color: Colors.white),),
                ),
              ),
              new ListTile(
                leading: new RaisedButton(onPressed:(){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => BillSplitter()));
                      } , child: new Text('rent'),),
                trailing:  new RaisedButton(onPressed:(){
    Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) =>repair()));
    } , child: new Text('repair'),
                 ),
              )
              // RaisedButton(
              //     child: Text("Go back ${this.houseName}"),
              //     onPressed: () {
              //       Navigator.pop(context);
              //     }),
            ],
          ),
        ),
      ),
    );
  }
}