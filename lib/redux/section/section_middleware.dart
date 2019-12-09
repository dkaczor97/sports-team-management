import 'package:redux/redux.dart';
import 'package:sports_team_management/data/repositories/section_repository.dart';
import 'package:sports_team_management/redux/app/app_state.dart';
import 'package:sports_team_management/redux/section/section_actions.dart';

List<Middleware<AppState>> createSectionMiddleware(SectionRepository repository){
  return[
    TypedMiddleware<AppState,LoadSections>(_loadSections(repository)),
    TypedMiddleware<AppState,AddUserSection>(_addUserSection(repository)),
    TypedMiddleware<AppState,DeleteUserSection>(_deleteUserSection(repository)),
    TypedMiddleware<AppState,AddSection>(_addSection(repository)),
    TypedMiddleware<AppState,EditSection>(_editSection(repository))
  ];
}

void Function(Store<AppState> store, LoadSections action, NextDispatcher next) _loadSections (SectionRepository repository){
  return(store,action,next) async{
    next(action);
    final sections = await repository.loadSections();
    store.dispatch(LoadSectionsResult(sections));
  };
}

void Function(Store<AppState> store, AddUserSection action, NextDispatcher next) _addUserSection (SectionRepository repository){
  return(store,action,next) async{
    next(action);
    await repository.addUserSection(action.userSection).then((res){
      store.dispatch(LoadSections());
    });
  };
}

void Function(Store<AppState> store, DeleteUserSection action, NextDispatcher next) _deleteUserSection (SectionRepository repository){
  return(store,action,next) async{
    next(action);
    await repository.removeUserSection(action.id).then((res){
      store.dispatch(LoadSections());
    });
  };
}

void Function(Store<AppState> store, EditSection action, NextDispatcher next) _editSection (SectionRepository repository){
  return(store,action,next) async{
    next(action);
    await repository.editSection(action.section).then((res){
      store.dispatch(LoadSections());
    });
  };
}

void Function(Store<AppState> store, AddSection action, NextDispatcher next) _addSection (SectionRepository repository){
  return(store,action,next) async{
    next(action);
    await repository.addSection(action.section).then((res){
      for(var user in action.section.users){
        final userToAdd = user.rebuild((u)=>u
        ..sectionId = res.id
        ..sectionName = res.name);
        store.dispatch(AddUserSection(userToAdd));
      }
    });
  };
}