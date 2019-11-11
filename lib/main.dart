import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:sports_team_management/data/repositories/auth_repository.dart';
import 'package:sports_team_management/models/user.dart';
import 'package:sports_team_management/redux/event/event_actions.dart';
import 'package:sports_team_management/redux/event/event_middleware.dart';
import 'package:sports_team_management/redux/user/user_actions.dart';
import 'package:sports_team_management/redux/user/user_middleware.dart';
import 'package:sports_team_management/ui/events/events-page.dart';
import 'package:sports_team_management/ui/events/events-screen.dart';
import 'package:sports_team_management/ui/home/home-page.dart';
import 'package:sports_team_management/ui/root/root-page.dart';
import 'package:sports_team_management/redux/app/app_reducer.dart';
import 'package:sports_team_management/redux/app/app_state.dart';
import 'package:sports_team_management/redux/auth/auth_middleware.dart';
import 'package:sports_team_management/redux/navigation/navigation_middleware.dart';
import 'package:sports_team_management/services/authentication/authentication.dart';
import 'package:sports_team_management/routes/routes.dart';
import 'package:sports_team_management/ui/user/edit/user_edit_vm.dart';
import 'package:sports_team_management/widgets/route_aware_widget.dart';

import 'data/repositories/event_repository.dart';
import 'data/repositories/user_repository.dart';


//void main() => runApp(MyApp());
void main(){
  final store = Store<AppState>(
    appReducer,
    initialState: AppState(
      isLoading: false
    ),
    middleware: []
     ..addAll(createStoreAuthMiddleware(
          AuthRepository(auth: FirebaseAuth.instance)
      ))
      ..addAll(createNavigationMiddleware())
      ..addAll(createStoreEventsMiddleware(EventRepository(Firestore.instance)))
      ..addAll(createStoreUserMiddleware(UserRepository(Firestore.instance)))
  );
  runApp(MyApp(store: store));
}

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();


class MyApp extends StatelessWidget {
  final Store<AppState> store;
  MyApp({this.store});
  // This widget is the root of your application.
MaterialPageRoute _getRoute(RouteSettings settings){
  switch(settings.name){
    case Routes.home:
      return MainRoute(HomePage(), settings: settings);
    case Routes.events:
    store.dispatch(LoadEvents());
      return MainRoute(EventsScreen(), settings: settings);
    case Routes.editUser:
    store.dispatch(LoadUserData());
    return MainRoute(UserEditScreen(), settings: settings);
    default:
      return MainRoute(HomePage(), settings: settings);
  }
}

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child:  MaterialApp(
        navigatorKey: navigatorKey,
        navigatorObservers: [routeObserver],
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark
      ),
      home: new RootPage(auth: new Authentication()),
      onGenerateRoute: (RouteSettings settings) => _getRoute(settings),
      // routes: {
      //   Routes.events: (context) => EventsPage(),
      //   Routes.home: (context) => HomePage()
      // },
    ),
    );
  }
}

class MainRoute<T> extends MaterialPageRoute<T> {
  MainRoute(Widget widget, {RouteSettings settings})
      : super(
            builder: (_) => RouteAwareWidget(child: widget),
            settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (settings.isInitialRoute) return child;
    // Fades between routes. (If you don't want any animation,
    // just return child.)
    return FadeTransition(opacity: animation, child: child);
  }
}

