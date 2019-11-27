import 'package:flutter/material.dart';
import 'package:sports_team_management/data/models/user.dart';
import 'package:sports_team_management/ui/user/user_list_item.dart';

class UserList extends StatelessWidget{
  UserList({this.users});
  final List<User> users;
  @override
  Widget build(BuildContext context){
    return ListView.builder(itemBuilder: (context, index){
      return UserListItem(user: users[index],);
    },
    itemCount: users.length,
    );
  }
}