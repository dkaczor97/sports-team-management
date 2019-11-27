import 'package:flutter/material.dart';
import 'package:sports_team_management/data/models/attendance.dart';

import 'attendance_list_item.dart';

class AttendanceList extends StatelessWidget{
  AttendanceList({this.attendanceList});
  final List<Attendance> attendanceList;
  @override
  Widget build(BuildContext context){
    return ListView.builder(itemBuilder: (context, index){
      return AttendanceListItem(attendance: attendanceList[index],);
    },
    itemCount: attendanceList.length,
    );
  }
}