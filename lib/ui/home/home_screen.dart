// import 'package:flutter/material.dart';
// import 'package:sports_team_management/services/authentication/base/base-authentication.dart';
// import 'package:sports_team_management/widgets/drawer/drawer-widget.dart';

// class HomePage extends StatelessWidget{
//   HomePage({this.auth,this.logoutCallback,this.userId});
//   static const String routeName = "/home";
//   final BaseAuthentication auth;
//   final VoidCallback logoutCallback;
//   final String userId;
//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       drawer: DrawerWidget(auth: auth),
//       appBar: new AppBar(
//         title: new Text("Login demo"),
//         actions: <Widget>[
//           new FlatButton(
//             child: new Text('Logout'),
//             onPressed: signOut,
//           )
//         ],
//       ),
//       body: new Container(
//         child: new Text("Siema"),
//       )
//     );
//   }

//   void signOut() async{
//     try{
//       await auth.signOut();
//       logoutCallback();
//     }
//     catch(e){
//       print(e);
//     }
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:sports_team_management/data/models/event.dart';
import 'package:sports_team_management/enums/role/roles.dart';
import 'package:sports_team_management/redux/app/app_state.dart';
import 'package:sports_team_management/redux/auth/auth_actions.dart';
import 'package:sports_team_management/redux/event/event_actions.dart';
import 'package:sports_team_management/routes/routes.dart';
import 'package:sports_team_management/ui/administration/administration_screen.dart';
import 'package:sports_team_management/ui/events/edit/event_edit.dart';
import 'package:sports_team_management/ui/events/events_screen.dart';
import 'package:sports_team_management/ui/user/edit/user_edit.dart';
import 'package:sports_team_management/ui/user/user_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  Widget _currentScreen = Scaffold();
  Widget _currentFab = Container();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            title: new Text("Home"),
            // actions: <Widget>[
            //   new FlatButton(
            //     child: new Text('Logout'),
            //     onPressed: ()=>StoreProvider.of<AppState>(context).dispatch(UserLogout()),
            //   )
            // ],
          ),
          drawer: _createDrawerWidget(context),
          body: _currentScreen,
          floatingActionButton: _currentFab,
        ),
      ],
    );
  }

  @override
  initState() {
    super.initState();
    _currentScreen = Text("init");
    _currentFab = Container();
  }

  Widget _createDrawerWidget(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _createHeader(context),
          _createDrawerItem(
              icon: Icons.home,
              text: "Strona główna",
              onTap: () {
                setState(() {
                  _currentScreen = Text("Home");
                  _currentFab = Container();
                });
                Navigator.of(context).pop();
              }),
          _createDrawerItem(
              icon: Icons.calendar_today,
              text: "Kalendarz",
              onTap: () {
                setState(() {
                  _currentScreen = EventsScreen();
                  final userRole =
                      StoreProvider.of<AppState>(context).state.user.role;
                  if (userRole != Roles.player) {
                    _currentFab = FloatingActionButton(
                      child: Icon(Icons.add),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => EventEdit(
                                  isNew: true,
                                  event: new Event(),
                                )));
                        StoreProvider.of<AppState>(context)
                            .dispatch(LoadEvents);
                      },
                    );
                  }
                });
                Navigator.of(context).pop();
              }),
          StoreProvider.of<AppState>(context).state.user.role == Roles.admin
              ? _createDrawerItem(
                  icon: Icons.settings,
                  text: "Administracja",
                  onTap: () {
                    setState(() {
                      _currentScreen = AdministrationScreen();
                      _currentFab = Container();
                    });
                    Navigator.of(context).pop();
                  })
              : Container()
        ],
      ),
    );
  }

  Widget _createHeader(BuildContext context) {
    return UserAccountsDrawerHeader(
        accountName:
            Text(StoreProvider.of<AppState>(context).state.user.name ?? ""),
        accountEmail:
            Text(StoreProvider.of<AppState>(context).state.user.email ?? ""),
        currentAccountPicture: CircleAvatar(
          child: Text(
            (StoreProvider.of<AppState>(context).state.user.email ?? " ")
                .substring(0, 1)
                .toUpperCase(),
            style: TextStyle(fontSize: 40.0),
          ),
        ),
        onDetailsPressed: () {
          final user = StoreProvider.of<AppState>(context).state.user;

          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => UserEdit(
                    user: user,
                    isCurrentUser: true,
                  )));
        });
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
