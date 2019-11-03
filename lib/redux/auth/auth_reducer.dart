import 'package:firebase_auth/firebase_auth.dart';
import 'package:redux/redux.dart';
import 'package:sports_team_management/redux/auth/auth_actions.dart';
import 'package:sports_team_management/redux/auth/auth_state.dart';

Reducer<AuthState> authReducer = combineReducers([
  TypedReducer<AuthState,UserLogin>(userLoginReducer),
  TypedReducer<AuthState,UserLoginSuccess>(userLoginSuccessReducer),
  TypedReducer<AuthState,UserLogout>(userLogoutReducer)
]);

AuthState userLoginReducer(AuthState authState, UserLogin action){
  return authState.copyWith();
}

AuthState userLoginSuccessReducer(AuthState authState, UserLoginSuccess action){
  return authState.copyWith(currrentUser: action.user);
}

AuthState userLogoutReducer(AuthState authState, UserLogout action){
  return authState.copyWith(currrentUser: null);
}