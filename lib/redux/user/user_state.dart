import 'package:sports_team_management/data/models/user_model.dart';

class UserState{
  final UserEntity user;
  UserState({this.user});
  UserState copyWith({UserEntity user}){
    return new UserState(user: user ?? this.user);
  }
}