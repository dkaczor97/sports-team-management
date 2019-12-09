import 'package:flutter/material.dart';
import 'package:sports_team_management/data/models/section.dart';
import 'package:sports_team_management/ui/section/edit/section_edit.dart';

class SectionListItem extends StatelessWidget {
  final Section section;
  SectionListItem(this.section);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(section.name),
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SectionEdit(isNew: false,section: section)));
        },
      ),
      
    );
  }
}