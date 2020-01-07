import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:sports_team_management/data/models/user.dart';
import 'package:sports_team_management/enums/role/roles.dart';
import 'package:sports_team_management/redux/app/app_state.dart';
import 'package:sports_team_management/redux/auth/auth_actions.dart';
import 'package:sports_team_management/ui/user/edit/user_edit_vm.dart';

class UserEdit extends StatefulWidget {
  final User user;
  final bool isCurrentUser;
  const UserEdit({this.user, this.isCurrentUser});

  @override
  _UserEditState createState() => _UserEditState();
}

class _UserEditState extends State<UserEdit> {
  final _nameFieldController = TextEditingController();
  final _jerseyNumberController = TextEditingController();
  String userRole;

  @override
  void initState() {
    super.initState();
    _nameFieldController.text = widget.user.name;
    _jerseyNumberController.text = widget.user.jerseyNumber.toString();
    userRole = widget.user.role;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Użytkownik"),
        ),
        body: Stack(
          children: <Widget>[showForm()],
        ));
  }

  Widget showForm() {
    return new Container(
      padding: EdgeInsets.fromLTRB(6,10,6,10),
      child: new Form(
        child: new ListView(
          shrinkWrap: true,
          children: <Widget>[
            showMailInput(),
            showDisplayNameInput(),
            showJerseyNumberInput(),
            showRoleInput(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
            showLogoutButton(),
                        showPrimaryButton(),

            ],)
          ],
        ),
      ),
    );
  }

  Widget showMailInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      child: new TextFormField(
        enabled: false,
        maxLines: 1,
        autofocus: false,
        decoration: new InputDecoration(
            labelText: 'e-mail', hasFloatingPlaceholder: true,
            fillColor: Theme.of(context).cardColor, filled: true),
        initialValue: widget.user.email,
      ),
    );
  }

  Widget showDisplayNameInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
      child: new TextFormField(
        controller: _nameFieldController,
        maxLines: 1,
        keyboardType: TextInputType.text,
        autofocus: false,
        decoration: new InputDecoration(
            labelText: 'Imię i nazwisko', hasFloatingPlaceholder: true,
            fillColor: Theme.of(context).cardColor, filled: true),
      ),
    );
  }

  Widget showJerseyNumberInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
      child: new TextFormField(
        controller: _jerseyNumberController,
        maxLines: 1,
        keyboardType: TextInputType.number,
        autofocus: false,
        decoration: new InputDecoration(
            labelText: 'Numer koszulki', hasFloatingPlaceholder: true,
            fillColor: Theme.of(context).cardColor, filled: true),
      ),
    );
  }

  Widget showRoleInput() {
    if (StoreProvider.of<AppState>(context).state.user.role == Roles.admin) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
        child: DropdownButtonFormField(
          decoration: new InputDecoration(
            labelText: 'Rola', hasFloatingPlaceholder: true,
            fillColor: Theme.of(context).cardColor, filled: true),
            value: userRole,
            items: <String>[
              Roles.admin,
              Roles.coach,
              Roles.management,
              Roles.player
            ].map<DropdownMenuItem<String>>((value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),
            onChanged: (value) {
              userRole = value;
              setState(() {});
            }),
      );
    } else {
      return Container();
    }
  }

  Widget showPrimaryButton() {
    return RaisedButton(
          child: new Text(
            "Zapisz".toUpperCase()
          ),
          onPressed: () {
            final userToUpdate = widget.user.rebuild((u) => u
              ..name = _nameFieldController.text
              ..jerseyNumber = int.parse(_jerseyNumberController.text)
              ..role = userRole);
            StoreProvider.of<AppState>(context).dispatch(EditUser(
                user: userToUpdate, isCurrentUser: widget.isCurrentUser));
            Navigator.of(context).pop();
          },
        );
  }

  Widget showLogoutButton() {
    if(widget.isCurrentUser){
      return FlatButton(
        textColor: Theme.of(context).buttonColor,
        child: Text("Wyloguj".toUpperCase()),
        onPressed: (){
          StoreProvider.of<AppState>(context).dispatch(UserLogout());
        },
      );
    }
    else{
      return Container();
    }
  }
}
