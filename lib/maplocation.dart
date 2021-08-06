import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:landlord/hexcolor.dart';
import 'package:latlong/latlong.dart';

import 'houselistView.dart';

/// This widget is the home page of the application.
class Mylocation extends StatefulWidget {
  /// Initialize the instance of the [MyHomePage] class.

  @override
  _MylocationState createState() => _MylocationState();
}
//https://faue-imbo.org/land_plot/land_plot.geojson/
class _MylocationState extends State<Mylocation> {
  final mapController = MapController();



  // Future<Map<String, dynamic>> getData(latit, longit) async {
  //   var uri = 'https://faue-imbo.org/land_plot/api/v1/point/polygon_compare/';
  //   try {
  //     Map body = {"lat": longit, "long": latit};
  //     var bodyEncoded = json.encode(body);
  //     var response = await http.post(uri, body: bodyEncoded, headers: {
  //       "Accept": "application/json",
  //       "Content-Type": "application/json ; charset=utf-8",
  //     });
  //     print('body: [${response.statusCode}]');
  //
  //     final responseJson = json.decode(response.body);
  //     setState(() {
  //       id = null;
  //       sea_id = null;
  //       sea_ass = null;
  //       sea_npp = null;
  //       sea_tel = null;
  //       sea_res = null;
  //     });
  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       setState(() {
  //         id = responseJson['id'];
  //         sea_id = responseJson['sea_id'];
  //         sea_ass = responseJson['sea_ass'];
  //         sea_npp = responseJson['sea_npp'];
  //         sea_tel = responseJson['sea_tel'];
  //         sea_res = responseJson['sea_res'];
  //        });
  //       setState(() {
  //         sea_id = responseJson['sea_id'];
  //         sea_ass = responseJson['sea_ass'];
  //         sea_npp = responseJson['sea_npp'];
  //         sea_tel = responseJson['sea_tel'];
  //         sea_res = responseJson['sea_res'];
  //       });
  //     }
  //     print('data : ${responseJson}');
  //     final int statusCode = response.statusCode;
  //   } catch (exception) {
  //     // Navigator.of(Variables.keyLoader.currentContext, rootNavigator: true).pop();
  //     print(exception);
  //     if (exception.toString().contains('SocketException')) {
  //       return {};
  //     } else {
  //       return null;
  //     }
  //   }
  // }
  @override
  void initState() {

    super.initState();
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Map Location"),
          automaticallyImplyLeading: true,
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
      body: FlutterMap(
        mapController: mapController,
        options: MapOptions(
          center: LatLng(51.5, -0.09),
          zoom: 13.0,
        ),

        layers: [
          TileLayerOptions(
              urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              subdomains: ['a', 'b', 'c']),

          MarkerLayerOptions(
            markers: [
              Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(51.5, -0.09),
                builder: (ctx) =>
                    Container(
                      child: new IconButton(
                        onPressed: (){
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
                                            Text('${data.housname}',textAlign: TextAlign.center,
                                                style:new TextStyle(color: Colors.green)),
                                            new Divider(

                                            ),
                                            Text('${data.housclient}',textAlign: TextAlign.center,
                                                style:new TextStyle(color: Colors.green)),
                                            // new Icon(
                                            //   Icons.check,
                                            //   size: 50,
                                            //   color: Colors.green,
                                            // ),
                                            new RaisedButton(
                                              color: Colors.green,
                                              onPressed: (){
                                                Navigator.pop(context);
                                                // Navigator.push(
                                                //     context,
                                                //     MaterialPageRoute(
                                                //         builder: (context) =>houselist()));
                                              },
                                              child: new Text('OK',style: new TextStyle(color: Colors.white),),

                                            )

                                          ],
                                        )
                                    )
                                );
                              });
                        },
                        icon: new Icon(
                         Icons.home,
size: 40,
                          color: Colors.blue,
                        ),
                      ),
                    ),
              ),
            ],
          ),
          // ADD THIS

        ],
      )


    );
  }

}
