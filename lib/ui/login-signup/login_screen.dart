import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:sports_team_management/ui/login-signup/login-signup-page.dart';
import 'package:sports_team_management/redux/app/app_state.dart';
import 'package:sports_team_management/redux/auth/auth_actions.dart';

class LoginScreen extends StatelessWidget{
  static const String route='/login';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sports management"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(40.0),
              child: _LoginForm()
            )
          ],
        ),
      )

      
    );
  }

}

class _LoginForm extends StatefulWidget{
  @override
  _LoginFormState createState(){
    return _LoginFormState();
  }
}

class _LoginFormState extends State<_LoginForm>{
  final _formKey = GlobalKey<FormState>();
  final _emailTextFieldController = TextEditingController();
  final _passwordTextFieldController = TextEditingController();
  
  @override
  void dispose(){
    _emailTextFieldController.dispose();
    _passwordTextFieldController.dispose();
    super.dispose();
  }

    @override
    Widget build(BuildContext context){
    final submitCallback = (){
      if(_formKey.currentState.validate()){
        final loginAction = UserLogin(
          email: _emailTextFieldController.text,
          password: _passwordTextFieldController.text
        );

        StoreProvider.of<AppState>(context).dispatch(loginAction);
        Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text("Trwa logowanie..."),));
        loginAction.completer.future.catchError((error){
          Scaffold.of(context).hideCurrentSnackBar();
          Scaffold.of(context).showSnackBar(SnackBar(content: Text(error.code.toString(),)));
        });
      }
    };

    final _submitButton = new RaisedButton(
            elevation: 5.0,
            // shape: new RoundedRectangleBorder(
            //     borderRadius: new BorderRadius.circular(30.0)),
            color: Colors.black26,
            child: new Text(
              "Login",
              style: new TextStyle(fontSize: 20.0, color: Colors.white),
            ),
            onPressed:
                submitCallback //vm.onLoginPressed(email: _email,password: _password),
            );

    final _emailInput = new TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        decoration: new InputDecoration(
            hintText: 'Email', icon: new Icon(Icons.mail, color: Colors.grey)),
        validator: (value) => value.isEmpty ? 'Email nie może być pusty' : null,
        controller: _emailTextFieldController,
      );

    final _passwordInput = new TextFormField(
        maxLines: 1,
        obscureText: true,
        controller: _passwordTextFieldController,
        decoration: new InputDecoration(
            hintText: 'Hasło', icon: new Icon(Icons.lock, color: Colors.grey)),
        validator: (value) => value.isEmpty ? 'Hasło nie może być puste' : null,
      );

      return Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            _emailInput,
            _passwordInput,
            _submitButton
          ],
        ),
      );
  }

}

// class LoginViewModel {
//   bool isLoading;
//   AuthState authState;
//   Function({String email, String password}) onLoginPressed;
//   Function({String email, String password}) onSignUpPressed;
//   LoginViewModel(
//       {this.isLoading,
//       this.authState,
//       this.onLoginPressed,
//       this.onSignUpPressed});

//   static LoginViewModel fromStore(Store<AppState> store) {
//     return LoginViewModel(
//         isLoading: store.state.isLoading,
//         authState: store.state.authState,
//         onLoginPressed: ({String email, String password}) {
//           if (store.state.isLoading) {
//             return;
//           }
//           final Completer<Null> completer = Completer<Null>();
//           store.dispatch(UserLogin(
//               completer: completer, email: email, password: password));
//         });
//   }
// }
