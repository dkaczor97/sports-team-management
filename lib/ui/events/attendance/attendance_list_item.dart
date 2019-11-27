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
      subtitle: Text(attendance.reason ?? ""),
    ));
  }

  Widget _getLeading(){
  if(attendance.status == AttendanceStatus.present){
    return CircleAvatar(
      child: Icon(Icons.check),
      backgroundColor: Color(Colors.green.value),
    );
  }
  else if (attendance.status == AttendanceStatus.absent){
    return CircleAvatar(
      child: Icon(Icons.close),
      backgroundColor: Color(Colors.red.value),
    );
  }
  else //if (attendance.status == AttendanceStatus.none)
  {
    return CircleAvatar(
      child: Icon(Icons.help),
      backgroundColor: Color(Colors.yellow[800].value),
    );
  }
}

}



