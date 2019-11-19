// import 'package:flutter/material.dart';
// import 'package:sports_team_management/services/authentication/base/base-authentication.dart';
// import 'package:sports_team_management/ui/events/event_list.dart';
// import 'package:sports_team_management/ui/events/events-screen.dart';
// import 'package:sports_team_management/widgets/drawer/drawer-widget.dart';

// // class EventsPage extends StatelessWidget {
// //   EventsPage({this.auth});
// //   final BaseAuthentication auth;

// //   static const String routeName = '/events';
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text("Events"),
// //       ),
// //       drawer: DrawerWidget(auth: auth,),
// //       body: Center(child: Text("Events"),),
// //     );
// //   }
// // }

// class EventsView extends StatelessWidget{
//   final EventsViewModel viewModel;
//   EventsView(this.viewModel);

//   @override
//   Widget build(BuildContext context) {
//     print(viewModel.events);
//     // TODO: implement build
//     return new Scaffold(
//         appBar: new AppBar(
//           title: new Text("Kalendarz"),
//         ),
//         body: 
//         EventList(events: viewModel.events),
//         floatingActionButton: FloatingActionButton(
//           onPressed: (){

//           },
//           child: Icon(Icons.add),
//         ),
//         );
//   }


// }
