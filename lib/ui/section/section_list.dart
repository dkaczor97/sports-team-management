import 'package:flutter/material.dart';
import 'package:sports_team_management/data/models/section.dart';
import 'package:sports_team_management/ui/section/section_list_item.dart';

class SectionList extends StatelessWidget {
  final List<Section> sections;
  SectionList({this.sections});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context,index){
      return SectionListItem(sections[index]);
    },
      itemCount: sections.length,
    );
  }
}