class FirestorePaths{
  static const PATH_USERS = 'users';
  static const PATH_EVENTS= 'events';
  static const PATH_ATTENDANTS= 'attendants';

  static String userPath(String userId){
    return '$PATH_USERS/$userId';
  }

  static String eventPath(String eventId){
    return '$PATH_EVENTS/$eventId';
  }

  static String attendancePath(String eventId, String attendanceId){
    return '$PATH_EVENTS/$eventId/$PATH_ATTENDANTS/$attendanceId';
  }
}