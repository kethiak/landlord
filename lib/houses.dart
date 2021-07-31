import 'package:flutter/material.dart';
import 'package:landlord/ui/tenant.dart';
class BizCard extends StatefulWidget {
  @override
  _BizCardState createState() => _BizCardState();
}

class _BizCardState extends State<BizCard> {
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
          children: <Widget>[
            _getCard(context),
            _getAvatar(context),
          ],
        ),
      ),
    );
  }

  Widget _getCard(BuildContext context) {
    return new GestureDetector(
      child: Container(
        width: 350,
        height: 200,
        margin: EdgeInsets.all(51.0),
        decoration: BoxDecoration(
            color: Colors.orangeAccent,
            borderRadius: BorderRadius.circular(14.5)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.person),
              ],
            ),
            Text(
              "+",
              style: TextStyle(
                  fontSize: 20.9,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              "Add ",
              style: TextStyle(
                  fontSize: 20.9,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              "Tenant",
              style: TextStyle(
                  fontSize: 20.9,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Tenant()));
      },
    );
  }

  Container _getAvatar(BuildContext context) {
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