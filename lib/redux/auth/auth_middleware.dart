import 'package:flutter/cupertino.dart';
import 'package:redux/redux.dart';
import 'package:sports_team_management/data/repositories/auth_repository.dart';
import 'package:sports_team_management/data/repositories/user_repository.dart';
import 'package:sports_team_management/redux/app/app_state.dart';
import 'package:sports_team_management/redux/auth/auth_actions.dart';
import 'package:sports_team_management/redux/navigation/navigation_actions.dart';
import 'package:sports_team_management/routes/routes.dart';

List<Middleware<AppState>> createAuthMiddleware(
    AuthRepository authRepository, GlobalKey<NavigatorState> navigatorKey) {
  return [
    TypedMiddleware<AppState, VerifyAuthenticationState>(_verifyAuthState(authRepository, navigatorKey)),
    TypedMiddleware<AppState, UserLogin>(_authLogin(authRepository, navigatorKey)),
    TypedMiddleware<AppState, UserLogout>(_authLogout(authRepository,navigatorKey)),
  ];
}

// Middleware<AppState> _firestoreSignIn(AuthRepository authRepository) {
//   return (Store<AppState> store, dynamic dynamicAction, NextDispatcher next) {
//     final action = dynamicAction as UserLogin;
//     authRepository
//         .login(email: action.email, password: action.password)
//         .then((result) {
//       store.dispatch(new UserLoginSuccess(user: result));
//     });
//     next(action);
//   };
// }

// Middleware<AppState> _firestoreSignInSuccess() {
//   return (Store<AppState> store, dynamic dynamicAction, NextDispatcher next) {
//     if (dynamicAction is UserLoginSuccess) {
//       store.dispatch(NavigatePushAction(Routes.home));
//     }
//     next(dynamicAction);
//   };
// }

void Function(Store<AppState> store, VerifyAuthenticationState action,
        NextDispatcher next)
    _verifyAuthState(
        AuthRepository authRepository, GlobalKey<NavigatorState> navigatorKey) {
  return (store, action, next) {
    next(action);
    authRepository.getAuthenticationStateChange().listen((user) {
      if (user == null) {
        navigatorKey.currentState.pushReplacementNamed(Routes.login);
      } else {
        store.dispatch(OnAuthenticated(user: user));
        navigatorKey.currentState.pushReplacementNamed(Routes.home);
      }
    });
  };
}

void Function(
  Store<AppState> store,
  dynamic action,
  NextDispatcher next,
) _authLogin(
  AuthRepository authRepository,
  GlobalKey<NavigatorState> navigatorKey,
) {
  return (store, action, next) async {
    next(action);
    try {
      final user = await authRepository.login(action.email, action.password);
      store.dispatch(OnAuthenticated(user: user));

      await navigatorKey.currentState.pushReplacementNamed(Routes.home);
      action.completer.complete();
    } catch (e) {
      action.completer.completeError(e);
    }
  };
}

void Function(
  Store<AppState> store,
  dynamic action,
  NextDispatcher next,
) _authLogout(
  AuthRepository authRepository,
  GlobalKey<NavigatorState> navigatorKey,
) {
  return (store, action, next) async {
    next(action);
    try {
      await authRepository.logout();
      store.dispatch(OnLogoutSuccess());
    } catch (e) {
      store.dispatch(OnLogoutFail(e));
    }
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
