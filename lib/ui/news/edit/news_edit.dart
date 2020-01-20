import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:sports_team_management/data/models/news.dart';
import 'package:sports_team_management/data/models/section.dart';
import 'package:sports_team_management/redux/app/app_state.dart';
import 'package:sports_team_management/redux/news/news_actions.dart';
import 'package:sports_team_management/ui/multiselect/multiselect_dialog.dart';
import 'package:sports_team_management/ui/news/edit/news_edit_vm.dart';

class NewsEdit extends StatefulWidget {
  final News news;
  final bool isNew;

  NewsEdit(this.news, this.isNew);
  @override
  _NewsEditState createState() => _NewsEditState();
}

class _NewsEditState extends State<NewsEdit> {
  final _titleFieldController = TextEditingController();
  final _contentFieldController = TextEditingController();
  List<Section> _currentSectionList = new List<Section>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (!widget.isNew) {
      _titleFieldController.text = widget.news.title;
      _contentFieldController.text = widget.news.content;
      _currentSectionList = widget.news.sections.toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector(
        converter: NewsEditVM.fromStore,
        builder: (context, vm) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Ogłoszenie"),
            ),
            body: showForm(vm),
            //Text("2"),
          );
        });
  }

  Widget showForm(NewsEditVM vm) {
    return new Container(
      padding: EdgeInsets.fromLTRB(6, 10, 6, 10),
      child: Form(
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            showTitleInput(),
            showContentInput(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[showSectionsButton(vm), showSaveButton(vm)],
            )
          ],
        ),
      ),
    );
  }

  Widget showTitleInput() {
    return TextFormField(
      controller: _titleFieldController,
      maxLines: 1,
      keyboardType: TextInputType.text,
      autofocus: false,
      decoration: new InputDecoration(
          labelText: 'Tytuł',
          hasFloatingPlaceholder: true,
          fillColor: Theme.of(context).cardColor,
          filled: true),
    );
  }

  Widget showContentInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
      child: new TextFormField(
        controller: _contentFieldController,
        maxLines: 10,
        keyboardType: TextInputType.text,
        autofocus: false,
        decoration: new InputDecoration(
            labelText: 'Treść',
            hasFloatingPlaceholder: true,
            fillColor: Theme.of(context).cardColor,
            filled: true),
      ),
    );
  }

  Widget showSectionsButton(NewsEditVM vm) {
    return new FlatButton(
        textColor: Theme.of(context).buttonColor,
        child: new Text(
          "Sekcje".toUpperCase(),
        ),
        onPressed: () async {
          editSections(vm);
        });
  }

  void editSections(NewsEditVM vm) async {
    final items = vm.sections.map((section) {
      return MultiselectDialogItem<Section>(
          value: section, label: section.name);
    }).toList();

    final selectedValues = await showDialog<List<Section>>(
        context: context,
        builder: (BuildContext context) {
          return MultiselectDialog<Section>(
            items: items,
            initialSelectedValues: vm.sections
                .where(
                    (test) => _currentSectionList.any((s) => s.id == test.id))
                .toList(),
          );
        });
    if (selectedValues == null) {
      return;
    }
    setState(() {
      _currentSectionList = selectedValues;
    });
  }

  Widget showSaveButton(NewsEditVM vm) {
    return new RaisedButton(
        child: new Text(
          "Zapisz".toUpperCase(),
        ),
        onPressed: () async {
          _save();
        });
  }

  void _save() {
    if (widget.isNew) {
      News newNews = News((n) => n
        ..title = _titleFieldController.text
        ..content = _contentFieldController.text
        ..sections.addAll(_currentSectionList));
      StoreProvider.of<AppState>(context).dispatch(AddNews(news: newNews));
    } else {
      final List<Section> newElements = new List<Section>();
      final List<Section> elementsToRemove = new List<Section>();
      for (var section in widget.news.sections) {
        if (!_currentSectionList.any((test) => test.id == section.id)) {
          elementsToRemove.add(section); //odznaczony
        } else {
          //nic sie nie zmieniło, można zostawić
          _currentSectionList.removeWhere((test) => test.id == section.id);
        }
      }
      newElements.addAll(_currentSectionList);
      for (var item in newElements) {
        StoreProvider.of<AppState>(context)
            .dispatch(AddSectionToNews(section: item, newsId: widget.news.id));
      }
      for (var item in elementsToRemove) {
        StoreProvider.of<AppState>(context).dispatch(
            RemoveSectionFromNews(sectionId: item.id, newsId: widget.news.id));
      }
    }
    Navigator.of(context).pop();
  }
}
