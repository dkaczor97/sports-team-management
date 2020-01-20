import 'package:flutter/material.dart';
import 'package:sports_team_management/data/models/attendance.dart';
import 'package:sports_team_management/enums/attendance/attendance_status.dart';

class AttendanceListItem extends StatelessWidget {
  AttendanceListItem({this.attendance});
  final Attendance attendance;
  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      leading: _getLeading(),
      title: Text(attendance.name),
    ));
  }

  Widget _getLeading(){
  if(attendance.status == AttendanceStatus.present){
    return CircleAvatar(
      child: Icon(Icons.check, color: Colors.white),
      backgroundColor: Color(Colors.green.value),
    );
  }
  else if (attendance.status == AttendanceStatus.absent){
    return CircleAvatar(
      child: Icon(Icons.close, 
      color: Colors.white),
      backgroundColor: Color(Colors.red.value),
    );
  }
  else 
  {
    return CircleAvatar(
      child: Icon(Icons.help, color: Colors.white),
      backgroundColor: Color(Colors.yellow[800].value),
    );
  }
}

}



