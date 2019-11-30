import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:intl/date_symbol_data_local.dart';
// import 'package:intl/date_symbol_data_http_request.dart';
// import 'package:intl/intl.dart';
import 'package:redux/redux.dart';
import 'package:sports_team_management/data/models/event.dart';
import 'package:sports_team_management/data/repositories/auth_repository.dart';
import 'package:sports_team_management/redux/auth/auth_actions.dart';
import 'package:sports_team_management/redux/event/event_actions.dart';
import 'package:sports_team_management/redux/event/event_middleware.dart';
import 'package:sports_team_management/ui/events/edit/event_edit.dart';
import 'package:sports_team_management/ui/events/events_screen.dart';
import 'package:sports_team_management/ui/home/home_screen.dart';
import 'package:sports_team_management/ui/login-signup/login_screen.dart';
import 'package:sports_team_management/ui/root/root-page.dart';
import 'package:sports_team_management/redux/app/app_reducer.dart';
import 'package:sports_team_management/redux/app/app_state.dart';
import 'package:sports_team_management/redux/auth/auth_middleware.dart';
import 'package:sports_team_management/redux/navigation/navigation_middleware.dart';
import 'package:sports_team_management/routes/routes.dart';
import 'package:sports_team_management/ui/user/edit/user_edit_vm.dart';
import 'package:sports_team_management/widgets/route_aware_widget.dart';

import 'data/repositories/event_repository.dart';
import 'data/repositories/user_repository.dart';


//void main() => runApp(MyApp());
void main(){
  initializeDateFormatting("pl_PL", null).then((param){
    runApp(SportsManagementApp());
  });
}

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();


class SportsManagementApp extends StatefulWidget {
  const SportsManagementApp({Key key}) : super(key: key);

  @override 
  _SportsManagementAppState createState()=> _SportsManagementAppState();

}

class _SportsManagementAppState extends State<SportsManagementApp>{
  Store<AppState> store;
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  @override
  void initState(){
    super.initState();
    store = Store<AppState>(
      appReducer,
      initialState: AppState.init(),
      middleware: 
        createAuthMiddleware(AuthRepository(FirebaseAuth.instance, Firestore.instance), navigatorKey)
         ..addAll(createStoreEventsMiddleware(EventRepository(Firestore.instance)))
    );
    store.dispatch(VerifyAuthenticationState());
          _firebaseMessaging.configure(
        onMessage: (Map<String, dynamic> message) async{
          print("onMessage: $message");
          showDialog(
            context: context,
            builder: (context)=>AlertDialog(
              content: ListTile(
                title: Text(message['notification']['title']),
                subtitle: Text(message['notification']['body']),
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text("Ok"),
                  onPressed: () => Navigator.of(context).pop(),
                )
              ],
            )
          );
        },
        onLaunch: (Map<String, dynamic> message) async{
          print("onLaunch: $message");
        },
        onResume: (Map<String, dynamic> message) async{
          print("onResume: $message");
        },
      );
      _firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(sound: true, badge: true, alert: true)
      );


  }

    @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: 'SportsManagementApp',
        navigatorKey: navigatorKey,
        theme: ThemeData(
          brightness: Brightness.dark
        ),
        routes: {
          Routes.loading: (context){
            return Scaffold(
              body: Center(child: Text("Trwa ładowanie"),),
            );
          },
          Routes.home: (context){
            return HomeScreen();
          },
          Routes.login: (context){
            return LoginScreen();
          },
          Routes.events: (context){
            return EventsScreen();
          },
          Routes.eventEdit:(context){
            return EventEdit();
          }
        },
      ),
    );
  }
}


class MessageHandler extends StatefulWidget {
  @override
  _MessageHandlerState createState() => _MessageHandlerState();
}

class _MessageHandlerState extends State<MessageHandler> {
  @override
  Widget build(BuildContext context) {
    FirebaseMessaging _fcm = FirebaseMessaging();
    return Container(
      
    );
    @override
    void initState(){
      super.initState();
      _fcm.configure(
        onMessage: (Map<String, dynamic> message) async{
          print("onMessage: $message");
          showDialog(
            context: context,
            builder: (context)=>AlertDialog(
              content: ListTile(
                title: Text(message['notification']['title']),
                subtitle: Text(message['notification']['body']),
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text("Ok"),
                  onPressed: () => Navigator.of(context).pop(),
                )
              ],
            )
          );
        },
        onLaunch: (Map<String, dynamic> message) async{
          print("onLaunch: $message");
        },
        onResume: (Map<String, dynamic> message) async{
          print("onResume: $message");
        },
      );
    }
  }
}