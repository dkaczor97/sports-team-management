import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:sports_team_management/pages/login-signup/login-signup-page.dart';
import 'package:sports_team_management/redux/app/app_state.dart';
import 'package:sports_team_management/redux/auth/auth_actions.dart';
import 'package:sports_team_management/redux/auth/auth_state.dart';

class LoginScreen extends StatelessWidget{
  static const String route='/login';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StoreConnector<AppState, LoginViewModel>(
        converter: LoginViewModel.fromStore,
        builder: (context, viewModel){
          return LoginView(viewModel: viewModel,);
        },
      )
    );
  }

}

class LoginViewModel {
  bool isLoading;
  AuthState authState;
  Function({String email, String password}) onLoginPressed;
  Function({String email, String password}) onSignUpPressed;
  LoginViewModel(
      {this.isLoading,
      this.authState,
      this.onLoginPressed,
      this.onSignUpPressed});

  static LoginViewModel fromStore(Store<AppState> store) {
    return LoginViewModel(
        isLoading: store.state.isLoading,
        authState: store.state.authState,
        onLoginPressed: ({String email, String password}) {
          if (store.state.isLoading) {
            return;
          }
          final Completer<Null> completer = Completer<Null>();
          store.dispatch(UserLogin(
              completer: completer, email: email, password: password));
        });
  }
}
