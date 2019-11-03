import 'package:sports_team_management/redux/app/app_state.dart';
import 'package:sports_team_management/redux/auth/auth_reducer.dart';
import 'package:sports_team_management/redux/navigation/navigation_reducer.dart';

AppState appReducer(AppState state, action){
  return state.copyWith(
    authState: authReducer(state.authState, action),
    route: navigationReducer(state.route, action)
  );
}