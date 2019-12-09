import 'package:redux/redux.dart';
import 'package:sports_team_management/data/repositories/news_repository.dart';
import 'package:sports_team_management/redux/app/app_state.dart';
import 'package:sports_team_management/redux/news/news_actions.dart';

List<Middleware<AppState>> createNewsMiddleware(
  NewsRepository repository
){
  return [
    TypedMiddleware<AppState, LoadNewsList>(_loadNewsList(repository)),
    TypedMiddleware<AppState, AddSectionToNews>(_addSectionToNewsList(repository)),
    TypedMiddleware<AppState, RemoveSectionFromNews>(_removeSectionFromNews(repository)),
    TypedMiddleware<AppState, AddNews>(_addNews(repository)),
 
  ];
}

void Function(
  Store<AppState> store,
  LoadNewsList action,
  NextDispatcher next,
) _loadNewsList(
  NewsRepository repository,
) {
  return (store, action, next) async {
    next(action);
    
    final newsList = await repository.loadNewsList();
    store.dispatch(LoadNewsListResult(newsList));
  };
}

void Function(
  Store<AppState> store,
  AddSectionToNews action,
  NextDispatcher next,
) _addSectionToNewsList(
  NewsRepository repository,
) {
  return (store, action, next) async {
    next(action);
    
    await repository.addSectionToNews(action.newsId, action.section).then((res){
      store.dispatch(LoadNewsList());
    });
  };
}

void Function(
  Store<AppState> store,
  RemoveSectionFromNews action,
  NextDispatcher next,
) _removeSectionFromNews(
  NewsRepository repository,
) {
  return (store, action, next) async {
    next(action);
    
    await repository.deleteSectionFromNews(action.newsId, action.sectionId).then((res){
      store.dispatch(LoadNewsList());
    });
  };
}


void Function(
  Store<AppState> store,
  AddNews action,
  NextDispatcher next,
) _addNews(
  NewsRepository repository,
) {
  return (store, action, next) async {
    next(action);
        await repository.addNews(action.news).then((res){
      for(var section in action.news.sections){
        store.dispatch(AddSectionToNews(newsId: res.id, section: section));
      }
      store.dispatch(LoadNewsList());
    });

  };
}