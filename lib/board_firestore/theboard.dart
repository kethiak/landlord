// import 'package:flutter/material.dart';
// import 'package:firebase_database/firebase_database.dart';
//
//
// class TheBoardApp extends StatefulWidget {
//   const TheBoardApp({Key key}) : super(key: key);
//
//   @override
//   _TheBoardAppState createState() => _TheBoardAppState();
// }
//
// class _TheBoardAppState extends State<TheBoardApp> {
//   //var firestoreDb = Firestore.instance.collection("board").snapshots();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Community Board"),
//       ),
//       body: StreamBuilder(
//     //    stream: firestoreDb,
//         builder: (context, snapshot) {
//           if(!snapshot.hasData) return CircularProgressIndicator();
//           return ListView.builder(
//             itemCount: snapshot.data.documents.length,
//               itemBuilder: (context, int index){
//               return Text(snapshot.data.documents[index]['title']);
//           });
//         },
//       ),
//     );
//   }
// }
