import 'package:flutter/material.dart';
import 'package:sports_team_management/data/models/user.dart';

import 'edit/user_edit.dart';

class UserListItem extends StatelessWidget {
  UserListItem({this.user});
  final User user;
  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>UserEdit(user: user, isCurrentUser: false,)));
          },
      leading: CircleAvatar(
        backgroundColor: Theme.of(context).buttonColor,
        foregroundColor: Theme.of(context).textTheme.button.color,
        child: Text(user.jerseyNumber.toString() ?? user.name?.substring(0,1)?.toUpperCase()),
      ),
      title: Text(user.name),
      subtitle: Text(user.role),
    ));
  }
}
