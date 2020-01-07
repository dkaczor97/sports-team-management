import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:sports_team_management/data/models/event.dart';
import 'package:sports_team_management/data/models/news.dart';
import 'package:sports_team_management/enums/role/roles.dart';
import 'package:sports_team_management/redux/app/app_state.dart';
import 'package:sports_team_management/redux/auth/auth_actions.dart';
import 'package:sports_team_management/redux/event/event_actions.dart';
import 'package:sports_team_management/redux/news/news_actions.dart';
import 'package:sports_team_management/redux/section/section_actions.dart';
import 'package:sports_team_management/routes/routes.dart';
import 'package:sports_team_management/ui/administration/administration_screen.dart';
import 'package:sports_team_management/ui/events/edit/event_edit.dart';
import 'package:sports_team_management/ui/events/events_screen.dart';
import 'package:sports_team_management/ui/home/home_screen_vm.dart';
import 'package:sports_team_management/ui/news/edit/news_edit.dart';
import 'package:sports_team_management/ui/news/news_screen.dart';
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
  String _userRole;
  Widget _currentFab = Container();
  String _appBarText = "Sport Team Managament";

  @override
  Widget build(BuildContext context) {
    return StoreConnector(
      converter: HomeScreenVM.fromStore,
      onInit: (Store<AppState> store){
        _userRole = store.state.user.role;
            _currentScreen = NewsScreen();
                _appBarText = "Strona główna";
if(_userRole != Roles.player){
  _currentFab = _createNewsFab();
}

      },
      builder: (context, vm) {
        return Stack(
          children: <Widget>[
            Scaffold(
              key: _scaffoldKey,
              appBar: AppBar(
                title: new Text(_appBarText),
              ),
              drawer: _createDrawerWidget(context),
              body: _currentScreen,
              floatingActionButton: _currentFab,
            ),
          ],
        );
      },
    );
  }

  // @override
  // initState() {
  //   super.initState();
  //   _currentScreen = NewsScreen();
  //   //_userRole = ;
  //   _currentFab = Container();
  //   _appBarText = "Strona główna";
  // }

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
                //final _userRole = StoreProvider.of<AppState>(context).state.user.role;
                StoreProvider.of<AppState>(context).dispatch(LoadNewsList());
                setState(() {
                  _currentScreen = NewsScreen();
                  _appBarText = "Strona główna";
                  if (_userRole != Roles.player) {
                    _currentFab = _createNewsFab();
                  } else {
                    _currentFab = Container();
                  }
                });
                Navigator.of(context).pop();
              }),
          _createDrawerItem(
              icon: Icons.calendar_today,
              text: "Kalendarz",
              onTap: () {
                //final _userRole = StoreProvider.of<AppState>(context).state.user.role;
                StoreProvider.of<AppState>(context).dispatch(LoadSections());
                StoreProvider.of<AppState>(context).dispatch(LoadEvents());
                setState(() {
                  _appBarText = "Wydarzenia";
                  _currentScreen = EventsScreen();
                  if (_userRole != Roles.player) {
                    _currentFab = _createEventsFab();
                  } else {
                    _currentFab = Container();
                  }
                });
                Navigator.of(context).pop();
              }),
          //StoreProvider.of<AppState>(context).state.user.role
          _userRole == Roles.admin
              ? _createDrawerItem(
                  icon: Icons.settings,
                  text: "Administracja",
                  onTap: () {
                    setState(() {
                      _appBarText = "Administracja";
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

  Widget _createEventsFab() {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => EventEdit(
                  isNew: true,
                  event: new Event(),
                )));
        StoreProvider.of<AppState>(context).dispatch(LoadEvents);
      },
    );
  }

  Widget _createNewsFab() {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => NewsEdit(
                  News.init(),
                  true,
                )));
        StoreProvider.of<AppState>(context).dispatch(LoadEvents);
      },
    );
  }

  Widget _createHeader(BuildContext context) {
    return UserAccountsDrawerHeader(
        accountName:
            Text(StoreProvider.of<AppState>(context).state.user.name ?? ""),
        accountEmail:
            Text(StoreProvider.of<AppState>(context).state.user.email ?? ""),
        currentAccountPicture: CircleAvatar(
          backgroundColor: Theme.of(context).buttonColor,
          foregroundColor: Theme.of(context).textTheme.button.color,
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
      return Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Theme.of(context).buttonColor
            )
          )
        ),
        margin: EdgeInsets.only(left: 16,right: 16),
        child: 
            ListTile(
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
    )
        ,
      );

  }
}
