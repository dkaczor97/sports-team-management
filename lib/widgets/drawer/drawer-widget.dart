import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:sports_team_management/redux/app/app_state.dart';
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
          _createHeader(
              StoreProvider.of<AppState>(context)),
          _createDrawerItem(
              icon: Icons.home,
              text: "Strona główna",
              onTap: () {
                //StoreProvider.of<AppState>(context).dispatch()
                //Navigator.of(context).pushNamed(Routes.events);
                }
             ),
          _createDrawerItem(
              icon: Icons.calendar_today,
              text: "Kalendarz",
              onTap: (){
                Navigator.of(context).pushNamed(Routes.events);
              }
              )
        ],
      ),
    );
  }


  Widget _createHeader(Store<AppState> store) {
    return UserAccountsDrawerHeader(
      accountName: Text(store.state.user.name ?? ""),
      accountEmail: Text(store.state.user.email ?? ""),
      currentAccountPicture: CircleAvatar(
        child: Text(
          (store.state.user.email ?? " ").substring(0, 1).toUpperCase(),
          style: TextStyle(fontSize: 40.0),
          
        ),
        
      ),
      // onDetailsPressed: () => store.dispatch(
      //             NavigatePushAction(Routes
      //                 .editUser)),
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
