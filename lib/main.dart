import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:redux/redux.dart';
import 'package:sports_team_management/data/repositories/auth_repository.dart';
import 'package:sports_team_management/data/repositories/news_repository.dart';
import 'package:sports_team_management/data/repositories/section_repository.dart';
import 'package:sports_team_management/redux/auth/auth_actions.dart';
import 'package:sports_team_management/redux/event/event_middleware.dart';
import 'package:sports_team_management/redux/news/news_middleware.dart';
import 'package:sports_team_management/redux/section/section_actions.dart';
import 'package:sports_team_management/redux/section/section_middleware.dart';
import 'package:sports_team_management/ui/events/edit/event_edit.dart';
import 'package:sports_team_management/ui/events/events_screen.dart';
import 'package:sports_team_management/ui/home/home_screen.dart';
import 'package:sports_team_management/ui/login-signup/login_screen.dart';
import 'package:sports_team_management/redux/app/app_reducer.dart';
import 'package:sports_team_management/redux/app/app_state.dart';
import 'package:sports_team_management/redux/auth/auth_middleware.dart';
import 'package:sports_team_management/routes/routes.dart';
import 'data/repositories/event_repository.dart';

void main() {
  initializeDateFormatting("pl_PL", null).then((param) {
    runApp(SportsManagementApp());
  });
}

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

class SportsManagementApp extends StatefulWidget {
  const SportsManagementApp({Key key}) : super(key: key);

  @override
  _SportsManagementAppState createState() => _SportsManagementAppState();
}

class _SportsManagementAppState extends State<SportsManagementApp> {
  Store<AppState> store;
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  @override
  void initState() {
    super.initState();
    store = Store<AppState>(appReducer,
        initialState: AppState.init(),
        middleware: 
          createAuthMiddleware(AuthRepository(FirebaseAuth.instance, Firestore.instance, _firebaseMessaging), navigatorKey)
          ..addAll(createStoreEventsMiddleware(EventRepository(Firestore.instance)))
          ..addAll(createSectionMiddleware(SectionRepository(Firestore.instance)))
          ..addAll(createNewsMiddleware(NewsRepository(Firestore.instance)))
          );
    store.dispatch(VerifyAuthenticationState());
    store.dispatch(LoadSections());
  }

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: 'SportsManagementApp',
        navigatorKey: navigatorKey,
        theme: ThemeData(brightness: Brightness.dark, buttonColor: Colors.teal),

        routes: {
          Routes.loading: (context) {
            return Scaffold(
              body: Center(
                child: Text("Trwa ładowanie"),
              ),
            );
          },
          Routes.home: (context) {
            return HomeScreen();
          },
          Routes.login: (context) {
            return LoginScreen();
          },
          Routes.events: (context) {
            return EventsScreen();
          },
          Routes.eventEdit: (context) {
            return EventEdit();
          }
        },
      ),
    );
  }
}
