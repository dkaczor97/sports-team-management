import 'package:redux/redux.dart';
import 'package:sports_team_management/redux/user/user_actions.dart';
import 'package:sports_team_management/redux/user/user_state.dart';

Reducer<UserState> userReducer = combineReducers(
  [
    TypedReducer<UserState,LoadUserData>(loadUserDataReducer),
    TypedReducer<UserState,LoadUserDataResult>(loadUserDataResultReducer),
    TypedReducer<UserState,UpdateUserData>(updateUserDataReducer)
  ]
);

UserState loadUserDataReducer(UserState userState, LoadUserData action){
  return userState.copyWith();
}

UserState loadUserDataResultReducer(UserState userState, LoadUserDataResult action){
  return userState.copyWith(user: action.user);
}

UserState updateUserDataReducer(UserState userState, UpdateUserData action){
  return userState.copyWith(user: action.user);
}