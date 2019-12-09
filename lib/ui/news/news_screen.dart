import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:sports_team_management/redux/app/app_state.dart';
import 'package:sports_team_management/redux/news/news_actions.dart';
import 'package:sports_team_management/ui/news/news_list.dart';
import 'package:sports_team_management/ui/news/news_screen_vm.dart';

class NewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,NewsScreenVM>(
      onInit: (a){
        a.dispatch(LoadNewsList());
      },
      converter: NewsScreenVM.fromStore,
      builder: (context, vm){
        return NewsList(
          newsList: vm.newsList.toList(),
        );
      },
    );
  }
}