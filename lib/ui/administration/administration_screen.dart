import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:sports_team_management/data/models/section.dart';
import 'package:sports_team_management/redux/app/app_state.dart';
import 'package:sports_team_management/redux/auth/auth_actions.dart';
import 'package:sports_team_management/redux/section/section_actions.dart';
import 'package:sports_team_management/ui/section/edit/section_edit.dart';
import 'package:sports_team_management/ui/section/section_list.dart';
import 'package:sports_team_management/ui/user/user_list.dart';

import 'administration_screen_vm.dart';

class AdministrationScreen extends StatefulWidget {
  @override
  _AdministrationScreenState createState() => _AdministrationScreenState();
}

class _AdministrationScreenState extends State<AdministrationScreen>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  Widget _currentFab;
  @override
  void initState() {
    super.initState();
    _currentFab = Container();
    _controller = new TabController(vsync: this, length: 2);
    _controller.addListener(() {
      setState(() {
        if (_controller.index == 1) {
          _currentFab = _createFab();
        } else {
          _currentFab = Container();
        }
      });
    });
  }

  @override
  void dispose() {
    _currentFab = Container();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AdministrationScreenVM>(
        onInit: (store) {
          store.dispatch(LoadUsers());
          store.dispatch(LoadSections());
        },
        converter: AdministrationScreenVM.fromStore,
        builder: (context, vm) {
          return Scaffold(
            appBar: new AppBar(
              actions: <Widget>[],
              title: new TabBar(
                controller: _controller,
                tabs: <Widget>[
                  new Tab(
                    text: "Użytkownicy",
                  ),
                  new Tab(
                    text: "Sekcje",
                  )
                ],
              ),
            ),
            body: new TabBarView(
              controller: _controller,
              children: <Widget>[
                UserList(users: vm.users.toList()),
                SectionList(
                  sections: vm.sections.toList(),
                )
              ],
            ),
            floatingActionButton: _currentFab,
          );
        });
  }

  Widget _createFab() {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => SectionEdit(
                  isNew: true,
                  section: Section.init(),
                )));
        StoreProvider.of<AppState>(context).dispatch(LoadSections());
      },
    );
  }
}
