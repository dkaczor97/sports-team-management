import 'package:flutter/material.dart';
import 'package:sports_team_management/services/authentication/base/base-authentication.dart';
import 'package:sports_team_management/widgets/drawer/drawer-widget.dart';

class EventsPage extends StatelessWidget {
  EventsPage({this.auth});
  final BaseAuthentication auth;

  static const String routeName = '/events';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Events"),
      ),
      drawer: DrawerWidget(auth: auth,),
      body: Center(child: Text("Events"),),
    );
  }
}