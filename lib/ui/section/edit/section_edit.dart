import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:sports_team_management/data/models/section.dart';
import 'package:sports_team_management/data/models/user.dart';
import 'package:sports_team_management/data/models/user_section.dart';
import 'package:sports_team_management/redux/app/app_state.dart';
import 'package:sports_team_management/redux/section/section_actions.dart';
import 'package:sports_team_management/ui/multiselect/multiselect_dialog.dart';
import 'package:sports_team_management/ui/section/edit/section_edit_vm.dart';

class SectionEdit extends StatefulWidget {
  final Section section;
  final bool isNew;
  SectionEdit({this.section, this.isNew});

  @override
  _SectionEditState createState() => _SectionEditState();
}

class _SectionEditState extends State<SectionEdit> {
  final _nameFieldController = TextEditingController();
  List<UserSection> _currentUserList;

  @override
  void initState() {
    super.initState();
    _nameFieldController.text = widget.section.name;
    _currentUserList = widget.section.users.toList();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector(
        converter: SectionEditVM.fromStore,
        builder: (context, vm) {
          return new Scaffold(
            appBar: new AppBar(
              title: new Text("Sekcja"),
            ),
            body: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                _showForm(vm),
              ],
            ),
          );
        });
  }

  Widget _showList() {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text(_currentUserList[index].userName),
          ),
        );
      },
      shrinkWrap: true,
      itemCount: _currentUserList.length,
    );
  }

  Widget _showForm(SectionEditVM vm) {
    return new Container(
      padding: EdgeInsets.all(16.0),
      child: new Form(
        child: new ListView(
          shrinkWrap: true,
          children: <Widget>[
            showNameInput(),
            _currentUserList != null ? _showList() : Container(),
            _showRemoveButton(),
            showEditButton(vm),
            showSaveButton()
          ],
        ),
      ),
    );
  }

  Widget showNameInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
      child: new TextFormField(
        controller: _nameFieldController,
        maxLines: 1,
        keyboardType: TextInputType.text,
        autofocus: false,
        decoration: new InputDecoration(
            labelText: 'Nazwa', hasFloatingPlaceholder: true),
      ),
    );
  }

  Widget _showRemoveButton() {
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
              "Usuń",
              style: new TextStyle(fontSize: 20.0, color: Colors.white),
            ),
            onPressed: () {
              // StoreProvider.of<AppState>(context)
              //     .dispatch(RemoveEvent(eventId: widget.event.id));
              // Navigator.of(context).pop();
            }),
      ),
    );
  }

  Widget showEditButton(SectionEditVM vm) {
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
              "Edytuj użytkowników",
              style: new TextStyle(fontSize: 20.0, color: Colors.white),
            ),
            onPressed: () async {
                editUsers(vm);
                
            }),
      ),
    );
  }

  void editUsers(SectionEditVM vm) async {
    final items = vm.users.map((user) {
      return MultiselectDialogItem<User>(value: user, label: user.name);
    }).toList();
    List<User> initialValues = new List<User>();
    if (_currentUserList != null) {
      initialValues = vm.users
          .where((test) => _currentUserList.any((us) => us.uid == test.uid))
          .toList();
    }

    final selectedValues = await showDialog<List<User>>(
        context: context,
        builder: (BuildContext context) {
          return MultiselectDialog(
            items: items,
            initialSelectedValues: initialValues,
          );
        });
    if (selectedValues == null) {
      return;
    }
    setState(() {
      
      _currentUserList = selectedValues
          .map((u) => UserSection((us) => us
            ..uid = u.uid
            ..userName = u.name
            ..sectionId = widget.section.id
            ..sectionName = widget.section.name))
          .toList();
    });
    //Navigator.of(context).pop();
  }

  Widget showSaveButton() {
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
            onPressed: () {
              if (widget.isNew) {
                Section newSection = Section((s) => s
                  ..name = _nameFieldController.text
                  ..users.addAll(_currentUserList));
                StoreProvider.of<AppState>(context)
                    .dispatch(AddSection(newSection));
              } else {
                // Section sectionToUpdate = widget.section.rebuild((s)=>
                // s..name = _nameFieldController.text
                // ..users.addAll(_currentUserList));

                //-------------------------------------
                final List<UserSection> newElements = new List<UserSection>();
                final List<UserSection> elementsToRemove =
                    new List<UserSection>();
                for (var us in widget.section.users) {
                  if (!_currentUserList.any((test) => test.uid == us.uid)) {
                    elementsToRemove.add(us); //odznaczony
                  } else {
                    //nic sie nie zmieniło, można zostawić
                    _currentUserList.removeWhere((test) => test.uid == us.uid);
                  }
                }
                newElements.addAll(_currentUserList);
                // for (User selectedUser in _currentUserList) {
                //   //tu już są same nowe
                //   newElements.add(new UserSection((us) => us
                //     ..uid = selectedUser.uid
                //     ..userName = selectedUser.name
                //     ..sectionId = widget.section.id
                //     ..sectionName = widget.section.name));
                // }
                for (var item in newElements) {
                  StoreProvider.of<AppState>(context)
                      .dispatch(AddUserSection(item));
                }
                for (var item in elementsToRemove) {
                  StoreProvider.of<AppState>(context)
                      .dispatch(DeleteUserSection(item.id));
                }
//----------------------------------------------
                // StoreProvider.of<AppState>(context)
                //     .dispatch(EditSection(sectionToUpdate));

              }
              Navigator.of(context).pop();
            }),
      ),
    );
  }
}
