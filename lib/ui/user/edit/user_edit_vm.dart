import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:sports_team_management/data/models/user_model.dart';
import 'package:sports_team_management/redux/app/app_state.dart';
import 'package:sports_team_management/redux/navigation/navigation_actions.dart';
import 'package:sports_team_management/redux/user/user_actions.dart';
import 'package:sports_team_management/ui/user/edit/user_edit.dart';

class UserEditScreen extends StatelessWidget{
  static const String route = '/user/edit';

  @override
  Widget build(BuildContext context){
    return StoreConnector<AppState, UserEditVM>(
      converter: (Store<AppState> store){
        return UserEditVM.fromStore(store);
      },
      builder: (context, viewModel){
        return UserEdit(
          viewModel: viewModel
        );
      },
    );
  }
}

class UserEditVM{
  UserEditVM({
    this.user,
    this.onSavePressed,
  });

  static UserEditVM fromStore(Store<AppState> store){
    return UserEditVM(
       user: store.state.userState.user,
       onSavePressed: (UserEntity user){
         store.dispatch(UpdateUserData(user: user));
         store.dispatch(NavigatePopAction());

       }
    );
  }

  final UserEntity user;
  final Function(UserEntity) onSavePressed;




}