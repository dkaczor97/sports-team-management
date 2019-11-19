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
import 'package:sports_team_management/redux/app/app_state.dart';
import 'package:sports_team_management/redux/auth/auth_actions.dart';
import 'package:sports_team_management/routes/routes.dart';
import 'package:sports_team_management/ui/events/events_screen.dart';
import 'package:sports_team_management/widgets/drawer/drawer-widget.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({Key key}): super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  Widget _currentScreen = Scaffold();
  @override
  Widget build(BuildContext context){
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
        ),

      ],
    );
  }
  @override
  initState(){
    super.initState();
    _currentScreen = Text("init");
  }

  Widget _createDrawerWidget(BuildContext context){
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
                setState(() {
                  _currentScreen = Text("Home");
                });
                //StoreProvider.of<AppState>(context).dispatch()
                //Navigator.of(context).pushNamed(Routes.events);
                }
             ),
          _createDrawerItem(
              icon: Icons.calendar_today,
              text: "Kalendarz",
              onTap: (){
                setState(() {
                  _currentScreen = EventsScreen();
                });
                //Navigator.of(context).pushNamed(Routes.events);
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