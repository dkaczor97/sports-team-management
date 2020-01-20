import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
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
  bool _isRegisterForm;
  
  @override
  void initState() {
    super.initState();
    _isRegisterForm = false;
  }

  @override
  void dispose(){
    _emailTextFieldController.dispose();
    _passwordTextFieldController.dispose();
    super.dispose();
  }

    @override
    Widget build(BuildContext context){
    final loginCallback = (){
      if(_isRegisterForm){
        final registerAction = UserSignup(
          email: _emailTextFieldController.text,
          password: _passwordTextFieldController.text
        );
        StoreProvider.of<AppState>(context).dispatch(registerAction);
                Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text("Trwa rejestracja..."),));

        registerAction.completer.future.catchError((error){
          Scaffold.of(context).hideCurrentSnackBar();
          Scaffold.of(context).showSnackBar(SnackBar(content: Text(error.code.toString(),)));
        });

      }
      else{
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

      }
    };

    final _submitButton = new RaisedButton(
            child: new Text(
              _isRegisterForm ? "Zarejestruj" : "Zaloguj się",
            ),
            onPressed:
                loginCallback 
            );

    final _changeStatusButton = new FlatButton(
      child: Text(
        _isRegisterForm ? "Powrót": "Załóż konto",
      ),
      onPressed:(){
        setState(() {
       _isRegisterForm = !_isRegisterForm;          
        });
      }
        

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
            _submitButton,
            _changeStatusButton
          ],
        ),
      );
  }

}
