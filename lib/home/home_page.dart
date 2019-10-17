// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class HomePage extends StatelessWidget{



//   Future<void> _signOut() async{
//     try{
//       await _firebaseAuth.signOut();
//     } catch (e){
//       print(e);
//     }
//   }

//     FirebaseAuth _firebaseAuth;

//   @override
//   Widget build(BuildContext context){
//     _firebaseAuth = Provider.of<FirebaseAuth>(context);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Home'),
//         actions: <Widget>[
//           FlatButton(
//             child: Text(
//               'Logout',
//               style: TextStyle(
//                 fontSize: 18.0,
//                 color: Colors.white
//               ),
//             ),
//             onPressed: _signOut,
//           )
//         ],
//       ),
//     );
//   }
// }