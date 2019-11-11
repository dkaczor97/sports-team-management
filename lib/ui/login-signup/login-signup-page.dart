import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:sports_team_management/ui/login-signup/login_screen.dart';
import 'package:sports_team_management/redux/app/app_state.dart';
import 'package:sports_team_management/redux/auth/auth_actions.dart';
import 'package:sports_team_management/redux/auth/auth_state.dart';
import 'package:sports_team_management/services/authentication/base/base-authentication.dart';

class LoginView extends StatefulWidget {
  LoginView({this.viewModel});

  final LoginViewModel viewModel;

  @override
  State<StatefulWidget> createState() => new _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = new GlobalKey<FormState>();
  bool _isLoading;
  String _email;
  String _password;
  bool _isLoginForm;
  String _errorMessage;

  @override
  void initState() {
    _errorMessage = "";
    _isLoading = false;
    _isLoginForm = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Login"),
        ),
        body: Stack(
          children: <Widget>[showForm(), showCircularProgress()],
        ));
  }

  Widget showForm() {
    return new Container(
      padding: EdgeInsets.all(16.0),
      child: new Form(
        key: _formKey,
        child: new ListView(
          shrinkWrap: true,
          children: <Widget>[
            showLogo(),
            showEmailInput(),
            showPasswordInput(),
            showPrimaryButton(),
            showSecondaryButton(),
            showErrorMessage()
          ],
        ),
      ),
    );
  }

  Widget showCircularProgress() {
    if (_isLoading) {
      return Center(child: CircularProgressIndicator());
    } else {
      return Container(
        height: 0.0,
        width: 0.0,
      );
    }
  }

  Widget showLogo() {
    return new Hero(
      tag: 'hero',
      child: Padding(
        padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 80.0,
          child: Image.asset('assets/logo.png'),
        ),
      ),
    );
  }

  Widget showEmailInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: new InputDecoration(
            hintText: 'Email', icon: new Icon(Icons.mail, color: Colors.grey)),
        validator: (value) => value.isEmpty ? 'Email nie może być pusty' : null,
        onSaved: (value) => _email = value.trim(),
      ),
    );
  }

  Widget showPasswordInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        obscureText: true,
        autofocus: false,
        decoration: new InputDecoration(
            hintText: 'Hasło', icon: new Icon(Icons.lock, color: Colors.grey)),
        validator: (value) => value.isEmpty ? 'Hasło nie może być puste' : null,
        onSaved: (value) => _password = value.trim(),
      ),
    );
  }

  Widget showPrimaryButton() {
    return new Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: SizedBox(
        height: 40.0,
        child: new RaisedButton(
            elevation: 5.0,
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0)),
            color: Colors.black26,
            child: new Text(
              _isLoginForm ? 'Zaloguj się' : 'Stwórz konto',
              style: new TextStyle(fontSize: 20.0, color: Colors.white),
            ),
            onPressed:
                validateAndSubmit //vm.onLoginPressed(email: _email,password: _password),
            ),
      ),
    );
  }

  void validateAndSubmit() async {
    setState(() {
      _errorMessage = "";
      _isLoading = true;
    });

    if (validateAndSave()) {
      String userId = "";
      try {
        if (_isLoginForm) {
          userId = widget.viewModel.onLoginPressed(email: _email, password: _password);
               //await widget.auth.signIn(_email, _password);
              print('Signed in: $userId');
        } else {
          //userId = await widget.auth.signUp(_email, _password);
          //widget.auth.sendEmailVerification();
          //_showVerifyEmailSentDialog();
          print('Signed up user: $userId');
        }
        setState(() {
          _isLoading = false;
        });

        if (userId != null && userId.length > 0 && _isLoginForm) {
          //widget.loginCallback();
        }
      } catch (e) {
        print('Error: $e');
        setState(() {
          _isLoading = false;
          _errorMessage = e.message;
          _formKey.currentState.reset();
        });
      }
    }
  }

  bool validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  Widget showSecondaryButton() {
    return new FlatButton(
      child: new Text(
        _isLoginForm ? 'Stwórz konto' : 'Masz konto? Zaloguj',
        style: new TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300),
      ),
      onPressed: toggleFormMode,
    );
  }

  void toggleFormMode() {
    resetForm();
    setState(() {
      _isLoginForm = !_isLoginForm;
    });
  }

  void resetForm() {
    _formKey.currentState.reset();
    _errorMessage = '';
  }

  Widget showErrorMessage() {
    if (_errorMessage != null && _errorMessage.length > 0) {
      return new Text(
        _errorMessage,
        style: TextStyle(
            fontSize: 13.0,
            color: Colors.red,
            height: 1.0,
            fontWeight: FontWeight.w300),
      );
    } else {
      return new Container(
        height: 0.0,
      );
    }
  }
}
