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
    if(!widget.isNew){
      _titleFieldController.text = widget.news.title;
      _contentFieldController.text = widget.news.content;
      _currentSectionList = widget.news.sections.toList();
    }
  }
  @override
  Widget build(BuildContext context) {
    return StoreConnector(
      converter: NewsEditVM.fromStore,
      builder: (context,vm){
        return DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              title: Text("Ogłoszenie"),
              bottom: TabBar(
                tabs: <Widget>[
                  Tab(text: "Szczegóły",),
                  Tab(text: "Potwierdzenia",)
                ],
              ),
            ),
            body: TabBarView(
              children: <Widget>[
                showForm(vm),
                //Text("2"),
                 showList()
              ],
            ),
          ),
        );
      },
    );
  }

  Widget showForm(NewsEditVM vm){
    return new Container(
      padding: EdgeInsets.all(16.0),
      child: Form(
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            showTitleInput(),
            showContentInput(),
            showSectionsButton(vm),
            showSaveButton(vm)
          ],
        ),
      ),
    );
  }

  Widget showTitleInput(){
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
      child: new TextFormField(
        controller: _titleFieldController,
        maxLines: 1,
        keyboardType: TextInputType.text,
        autofocus: false,
        decoration: new InputDecoration(
            labelText: 'Tytuł', hasFloatingPlaceholder: true),
      ),
    );
  }

  Widget showContentInput(){
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
      child: new TextFormField(
        controller: _contentFieldController,
        maxLines: 10,
        keyboardType: TextInputType.text,
        autofocus: false,
        decoration: new InputDecoration(
            labelText: 'Treść', hasFloatingPlaceholder: true),
      ),
    );
  }

  Widget showSectionsButton(NewsEditVM vm) {
    return new Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: SizedBox(
        height: 40.0,
        child: new RaisedButton(
            elevation: 5.0,
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0)),
            color: Colors.black26,
            child: new Text(
              "Sekcje",
              style: new TextStyle(fontSize: 20.0, color: Colors.white),
            ),
            onPressed: () async {
              editSections(vm);
            }),
      ),
    );
  }

  void editSections(NewsEditVM vm) async {
    final items = vm.sections.map((section) {
      return MultiselectDialogItem<Section>(value: section, label: section.name);
    }).toList();

    final selectedValues = await showDialog<List<Section>>(
        context: context,
        builder: (BuildContext context) {
          return MultiselectDialog<Section>(
            items: items,
            initialSelectedValues: vm.sections
                .where((test) =>
                    _currentSectionList.any((s) => s.id == test.id)).toList(),
          );
        });
    if(selectedValues == null){
      return;
    }
    setState(() {
      _currentSectionList = selectedValues;
    });
    // final List<Section> newElements = new List<Section>();
    // final List<Section> elementsToRemove = new List<Section>();
    // for (var s in widget.event.sections) {
    //   if (!selectedValues.any((test) => test.id == s.id)) {
    //     elementsToRemove.add(s); //odznaczony
    //   } else {
    //     //nic sie nie zmieniło, można zostawić
    //     selectedValues.removeWhere((test) => test.id == s.id);
    //   }
    // }
    // for (Section selectedSection in selectedValues) {
    //   //tu już są same nowe
    //   newElements.add(new Section((s) => s
    //     ..id = selectedSection.id
    //     ..name = selectedSection.name
    //     ));
    // }
    // for (var item in newElements) {
    //   StoreProvider.of<AppState>(context).dispatch(AddSectionToEvent(eventId: widget.event.id, section: item));
    // }
    // for (var item in elementsToRemove) {
    //   StoreProvider.of<AppState>(context).dispatch(DeleteSectionFromEvent(eventId: widget.event.id, sectionId: item.id));
    // }
    // Navigator.of(context).pop();
  }

  Widget showSaveButton(NewsEditVM vm) {
    return new Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: SizedBox(
        height: 40.0,
        child: new RaisedButton(
            elevation: 5.0,
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0)),
            color: Colors.black26,
            child: new Text(
              "Zapisz",
              style: new TextStyle(fontSize: 20.0, color: Colors.white),
            ),
            onPressed: () async {
              _save();
            }),
      ),
    );
  }

  void _save(){
                  if (widget.isNew) {
                News newNews = News((n) => n
                  ..title = _titleFieldController.text
                  ..content = _contentFieldController.text
                  ..sections.addAll(_currentSectionList));
                StoreProvider.of<AppState>(context)
                    .dispatch(AddNews(news: newNews));
              } else {
                final List<Section> newElements = new List<Section>();
                final List<Section> elementsToRemove =
                    new List<Section>();
                for (var us in widget.news.sections) {
                  if (!_currentSectionList.any((test) => test.id == us.id)) {
                    elementsToRemove.add(us); //odznaczony
                  } else {
                    //nic sie nie zmieniło, można zostawić
                    _currentSectionList.removeWhere((test) => test.id == us.id);
                  }
                }
                newElements.addAll(_currentSectionList);
                for (var item in newElements) {
                  StoreProvider.of<AppState>(context)
                      .dispatch(AddSectionToNews(section: item, newsId: widget.news.id));
                }
                for (var item in elementsToRemove) {
                  StoreProvider.of<AppState>(context)
                      .dispatch(RemoveSectionFromNews(sectionId: item.id, newsId: widget.news.id));
                }
//----------------------------------------------
                // StoreProvider.of<AppState>(context)
                //     .dispatch(EditSection(sectionToUpdate));

              }
              Navigator.of(context).pop();

  }


  Widget showList(){
    return Container();
  }

}