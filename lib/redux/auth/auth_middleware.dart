import 'package:redux/redux.dart';
import 'package:sports_team_management/data/repositories/auth_repository.dart';
import 'package:sports_team_management/models/user.dart';
import 'package:sports_team_management/redux/app/app_state.dart';
import 'package:sports_team_management/redux/auth/auth_actions.dart';
import 'package:sports_team_management/redux/navigation/navigation_actions.dart';
import 'package:sports_team_management/routes/routes.dart';

List<Middleware<AppState>> createStoreAuthMiddleware(
  AuthRepository authRepository
){
  return[
    TypedMiddleware<AppState,UserLogin>(_firestoreSignIn(authRepository)),
    TypedMiddleware<AppState,UserLoginSuccess>(_firestoreSignInSuccess())
  ];
}

Middleware<AppState> _firestoreSignIn(AuthRepository authRepository) {
  return(Store<AppState> store, dynamic dynamicAction, NextDispatcher next){
    final action = dynamicAction as UserLogin;
    authRepository.login(email: action.email, password: action.password).then((result){
      store.dispatch(new UserLoginSuccess(user: result));
    });
    next(action);
  };
}


Middleware<AppState> _firestoreSignInSuccess(){
  return (Store<AppState> store, dynamic dynamicAction, NextDispatcher next){
    if(dynamicAction is UserLoginSuccess){
      store.dispatch(NavigatePushAction(Routes.home));
    }
    next(dynamicAction);
  };
}
// Middleware<AppState> _firestoreSignOut(AuthRepository authRepository) {
//   return(Store<AppState> store, dynamic dynamicAction, NextDispatcher next){
//     final action = dynamicAction as UserLogout;
//     authRepository.login(email: action.email, password: action.password).then((result){
//       store.dispatch(new UserLoginSuccess(email: result.email));
//     });
//     next(action);
//   };
// }