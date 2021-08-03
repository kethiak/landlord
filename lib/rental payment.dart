
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'houselistView.dart';

class BillSplitter extends StatefulWidget {
  @override
  _BillSplitterState createState() => _BillSplitterState();
}

class _BillSplitterState extends State<BillSplitter> {
  int _tipPercentage = 0;
  int _personCounter = 1;
  double _billAmount = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        automaticallyImplyLeading: true,
        title: new Text('Rent Payment'),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
        alignment: Alignment.center,
        color: Colors.white,
        child: ListView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(20.5),
          children: <Widget>[
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(12.0)),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Total Per Month",
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 15.0,
                          color: Colors.blue),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        " \$ ${calculateTotalPerPerson(_billAmount, _personCounter, _tipPercentage)}",
                        style: TextStyle(
                            fontSize: 34.9,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 20.0),
                padding: EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(
                        color: Colors.blueGrey.shade100,
                        style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(12.0)),
                child: Column(
                  children: <Widget>[
                    TextField(
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      style: TextStyle(color: Colors.grey),
                      decoration: InputDecoration(
                          prefixText: "Bill Amount",
                          prefixIcon: Icon(Icons.attach_money)),
                      onChanged: (String value) {
                        try {
                          _billAmount = double.parse(value);
                        } catch (exception) {
                          _billAmount = 0.0;
                        }
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Split",
                          style: TextStyle(
                              color: Colors.grey.shade700,
                              fontWeight: FontWeight.bold,
                              fontSize: 17.0),
                        ),
                        Row(children: <Widget>[
                          InkWell(
                            onTap: () {
                              setState(() {
                                if (_personCounter > 1) {
                                  _personCounter--;
                                } else {}
                              });
                            },
                            child: Container(
                              width: 40.0,
                              height: 40.0,
                              margin: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7.0),
                                  color: Colors.blue.withOpacity(0.1)),
                              child: Center(
                                child: Text(
                                  "-",
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17.0),
                                ),
                              ),
                            ),
                          ),
                        ]),
                        Text(
                          "$_personCounter",
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 17.0),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _personCounter++;
                            });
                          },
                          child: Container(
                            width: 40.0,
                            height: 40.0,
                            margin: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                                color: Colors.blue.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(7.0)),
                            child: Center(
                              child: Text(
                                "+",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    //Tip

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Tip",
                          style: TextStyle(color: Colors.blue.shade700),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Text(
                            "\$ ${calculateTotalTip(_billAmount, _personCounter, _tipPercentage)}",
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                fontSize: 17.0),
                          ),
                        )
                      ],
                    ),

                    //Slider

                    Column(
                      children: <Widget>[
                        Text(
                          "$_tipPercentage%",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 17.0,
                              fontWeight: FontWeight.bold),
                        ),
                        Slider(
                            min: 0,
                            max: 100,
                            activeColor: Colors.blue,
                            inactiveColor: Colors.grey,
                            divisions: 10, //optional
                            value: _tipPercentage.toDouble(),
                            onChanged: (double newValue) {
                              setState(() {
                                _tipPercentage = newValue.round();
                              });
                            })
                      ],
                    ),
          Text(
            "Ways of Payments",
            style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 15.0,
                color: Colors.blue),),
              new ListTile(
                onTap: (){
                  null;
                },
                leading:new GestureDetector(
                  onTap: (){
null;
                  },
                  child: RotatedBox(
                      quarterTurns: 4,
                      child: ClipRRect(
                        borderRadius:
                        BorderRadius.circular(10),
                        child: new Image.asset(
                          "images/ecocash.gif",
                        ),
                      )
                  ),
                ),
               trailing: RotatedBox(
                    quarterTurns: 4,
                    child: ClipRRect(
                      borderRadius:
                      BorderRadius.circular(10),
                      child: new Image.asset(
                        "images/lumicash.png",
                      ),
                    )
                ),
              )
                  ],
                )),
            new RaisedButton(
              color: Colors.blue,
              onPressed:(){

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
                              new Column(
                                children: [
                                  Text('Payment done successfuly!!!!',textAlign: TextAlign.center,
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
              child: new Text('PAY',style: new TextStyle(color: Colors.white,fontSize: 14),),
            )
          ],
        ),
      ),
    );
  }

  calculateTotalPerPerson(double billAmount, int splitBy, int tipPercentage) {
    var totalPerPerson =
        (calculateTotalTip(billAmount, splitBy, tipPercentage) + billAmount) /
            splitBy;
    return totalPerPerson.toStringAsFixed(2);
  }

  calculateTotalTip(double billAmount, int splitBy, int tipPercentage) {
    double totalTip = 0.0;

    if (billAmount < 0 || billAmount.toString().isEmpty || billAmount == null) {
      // no go!

    } else {
      totalTip = (billAmount * tipPercentage) / 100;
    }
    return totalTip;
  }
}
