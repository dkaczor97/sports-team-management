
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:sports_team_management/redux/app/app_state.dart';
import 'package:sports_team_management/redux/auth/auth_actions.dart';
import 'package:sports_team_management/ui/user/user_list.dart';

import 'administration_screen_vm.dart';

class AdministrationScreen extends StatelessWidget{
    static const String route='/administration';

  @override
  Widget build(BuildContext context){
    return StoreConnector<AppState, AdministrationScreenVM>(
      onInit: (store){
        store.dispatch(LoadUsers());
      },
      converter: AdministrationScreenVM.fromStore,
      builder: (context, vm){
        return DefaultTabController(
          length: 1,
          child: new Scaffold(
            appBar: new AppBar(
              actions: <Widget>[],
              title: new TabBar(
                tabs: <Widget>[
                  new Tab(text: "Użytkownicy",),
                ],
              ),
            ),
            body: new TabBarView(
              children: <Widget>[
                UserList(users: vm.users.toList()),
              ],
            ),
          ),
        );
      },
    );
  }
}