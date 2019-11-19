// import 'package:redux/redux.dart';
// import 'package:sports_team_management/main.dart';
// import 'package:sports_team_management/redux/app/app_state.dart';
// import 'package:sports_team_management/redux/navigation/navigation_actions.dart';

// List<Middleware<AppState>> createNavigationMiddleware(){
//   return [
//     TypedMiddleware<AppState, NavigateReplaceAction>(_navigateReplace),
//     TypedMiddleware<AppState, NavigatePushAction>(_navigate)
//   ];
// }

// _navigateReplace(Store<AppState> store, action, NextDispatcher next){
//   final routeName = (action as NavigateReplaceAction).routeName;
//   if(store.state.route.last != routeName){
//     navigatorKey.currentState.pushReplacementNamed(routeName);
//   }
//   next(action);
// }

// _navigate(Store<AppState> store, action, NextDispatcher next){
//   final routeName = (action as NavigatePushAction).routeName;
//     navigatorKey.currentState.pushNamed(routeName);
//   next(action);
// }

// _navigateBack(Store<AppState> store, action, NextDispatcher next){
//   final routeName = (action as NavigatePushAction).routeName;
//     navigatorKey.currentState.pushNamed(routeName);
//   next(action);
// }