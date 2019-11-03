import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:sports_team_management/data/repositories/auth_repository.dart';
import 'package:sports_team_management/pages/events/events-page.dart';
import 'package:sports_team_management/pages/home/home-page.dart';
import 'package:sports_team_management/pages/root/root-page.dart';
import 'package:sports_team_management/redux/app/app_reducer.dart';
import 'package:sports_team_management/redux/app/app_state.dart';
import 'package:sports_team_management/redux/auth/auth_middleware.dart';
import 'package:sports_team_management/redux/navigation/navigation_middleware.dart';
import 'package:sports_team_management/services/authentication/authentication.dart';
import 'package:sports_team_management/routes/routes.dart';
import 'package:sports_team_management/widgets/route_aware_widget.dart';


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
    case Routes.events:
      return MainRoute(HomePage(), settings: settings);
    case Routes.events:
      return MainRoute(EventsPage(), settings: settings);
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

