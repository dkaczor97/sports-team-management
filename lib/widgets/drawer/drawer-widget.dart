import 'package:flutter/material.dart';
import 'package:sports_team_management/routes/routes.dart';
import 'package:sports_team_management/services/authentication/base/base-authentication.dart';

class DrawerWidget extends StatelessWidget {
  DrawerWidget({this.auth});

  final BaseAuthentication auth;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _createHeader(),
          _createDrawerItem(icon: Icons.home, text: "Strona główna", onTap: ()=> Navigator.pushReplacementNamed(context, Routes.events, arguments: auth)),
          _createDrawerItem(icon: Icons.calendar_today, text: "Kalendarz", onTap: ()=> Navigator.pushReplacementNamed(context, Routes.events, arguments: auth))
        ],
      ),
    );
  }

  Widget _createHeader() {
    return FutureBuilder(
      future: auth.getCurrentUser(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return UserAccountsDrawerHeader(
            accountName: Text(snapshot.data.displayName ?? ""),
            accountEmail: Text(snapshot.data.email ?? ""),
            currentAccountPicture: CircleAvatar(
              child: Text(
                (snapshot.data.email ?? " ").substring(0, 1),
                style: TextStyle(fontSize: 40.0),
              ),
            ),
          );
        }
        else{
          return CircularProgressIndicator();
        }
      },
    );
  }

  Widget _createDrawerItem(
      {IconData icon, String text, GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}
