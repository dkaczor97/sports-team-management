// import 'package:flutter/material.dart';
// import 'package:flutter_redux/flutter_redux.dart';
// import 'package:sports_team_management/redux/app/app_state.dart';
// import 'package:sports_team_management/redux/navigation/navigation_actions.dart';

// final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

// class RouteAwareWidget extends StatefulWidget{
//   final Widget child;
//   RouteAwareWidget({this.child});
//   State<RouteAwareWidget> createState() => RouteAwareWidgetState(child: child);
// }

// class RouteAwareWidgetState extends State<RouteAwareWidget> with RouteAware{
//   final Widget child;

//   RouteAwareWidgetState({this.child});

//   @override
//   void didChangeDependecies(){
//     super.didChangeDependencies();
//     routeObserver.subscribe(this, ModalRoute.of(context));
//   }

//   @override
//   void dispose(){
//     routeObserver.unsubscribe(this);
//     super.dispose();
//   }

//   @override
//   void didPush(){

//   }

//   @override
//   void didPopNext(){
//     StoreProvider.of<AppState>(context).dispatch(NavigatePopAction());
//   }

//   @override
//   Widget build(BuildContext context) => Container(child: child,);
// }