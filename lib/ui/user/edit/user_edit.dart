import 'package:flutter/material.dart';
import 'package:sports_team_management/data/models/user_model.dart';
import 'package:sports_team_management/ui/user/edit/user_edit_vm.dart';

class UserEdit extends StatefulWidget{
 const UserEdit({
   this.viewModel
 });

 final UserEditVM viewModel;

 @override
 _UserEditState createState() => _UserEditState();
}

class _UserEditState extends State<UserEdit>{
  String _displayName;
  int _jerseyNumber;
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Użytkownik"),
      ),
      body: Stack(
        children: <Widget>[showForm()],
      )
    );
  }

    Widget showForm() {
    return new Container(
      padding: EdgeInsets.all(16.0),
      child: new Form(
        child: new ListView(
          shrinkWrap: true,
          children: <Widget>[
            showDisplayNameInput(),
            showJerseyNumberInput(),
            showPrimaryButton(),
            // showSecondaryButton(),
            // showErrorMessage()
          ],
        ),
      ),
    );
  }

  Widget showDisplayNameInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.text,
        autofocus: false,
        decoration: new InputDecoration(
            labelText: 'Imię i nazwisko', hasFloatingPlaceholder: true),
        onChanged:(value){
           _displayName = value.trim();
           },
        initialValue: widget.viewModel.user.displayName,
      ),
    );
  }

  Widget showJerseyNumberInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.number,
        autofocus: false,
        decoration: new InputDecoration(
            labelText: 'Numer koszulki', hasFloatingPlaceholder: true),
        onChanged:(value) {
          _jerseyNumber = int.parse(value);
        },
        initialValue: widget.viewModel.user.jerseyNumber.toString(),
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
              "Zapisz",
              style: new TextStyle(fontSize: 20.0, color: Colors.white),
            ),
            onPressed: (){
              final user = UserEntity(
                uid: widget.viewModel.user.uid, 
                displayName: _displayName ?? widget.viewModel.user.displayName, 
                jerseyNumber: _jerseyNumber ?? widget.viewModel.user.jerseyNumber, 
                id: widget.viewModel.user.id);
              widget.viewModel.onSavePressed(user);
            },
            ),
      ),
    );
  }
}