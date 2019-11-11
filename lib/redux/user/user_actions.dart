import 'package:sports_team_management/data/models/user_model.dart';

class LoadUserData{
  final String uid;
  LoadUserData({this.uid});
}

class LoadUserDataResult{
  final UserEntity user;

  LoadUserDataResult({this.user});
}

class UpdateUserData{
  final UserEntity user;

  UpdateUserData({this.user});
}