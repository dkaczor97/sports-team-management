import 'package:firebase_auth/firebase_auth.dart';
import 'package:redux/redux.dart';
import 'package:sports_team_management/redux/app/app_state.dart';
import 'package:sports_team_management/redux/auth/auth_actions.dart';

final authReducers = <AppState Function(AppState, dynamic)>[
  TypedReducer<AppState,OnAuthenticated>(_onAuthenticated),
  TypedReducer<AppState,OnLogoutSuccess>(_onLogout)
];

AppState _onAuthenticated(AppState state, OnAuthenticated action){
  return state.rebuild((a)=>a..user = action.user.toBuilder());
}

AppState _onLogout(AppState state, OnLogoutSuccess action){
  return state.clear();
}