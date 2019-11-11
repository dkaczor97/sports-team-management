import 'package:sports_team_management/redux/app/app_state.dart';
import 'package:sports_team_management/redux/auth/auth_reducer.dart';
import 'package:sports_team_management/redux/event/event_reducer.dart';
import 'package:sports_team_management/redux/navigation/navigation_reducer.dart';
import 'package:sports_team_management/redux/user/user_reducer.dart';

AppState appReducer(AppState state, action){
  return state.copyWith(
    authState: authReducer(state.authState, action),
    eventState: eventReducer(state.eventState, action),
    userState: userReducer(state.userState, action),
    route: navigationReducer(state.route, action)
  );
}