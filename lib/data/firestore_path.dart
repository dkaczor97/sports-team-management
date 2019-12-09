class FirestorePaths{
  static const PATH_USERS = 'users';
  static const PATH_EVENTS= 'events';
  static const PATH_ATTENDANTS= 'attendants';
  static const PATH_SECTIONS= 'sections';
  static const PATH_USERSSECTIONS= 'usersSections';
  static const PATH_NEWS = 'news';
  static const PATH_CONFIRMATIONS = 'confirmations';

  static String userPath(String userId){
    return '$PATH_USERS/$userId';
  }

  static String eventPath(String eventId){
    return '$PATH_EVENTS/$eventId';
  }

  static String attendancePath(String eventId, String attendanceId){
    return '$PATH_EVENTS/$eventId/$PATH_ATTENDANTS/$attendanceId';
  }

  static String userSectionPath(String id){
    return '$PATH_USERSSECTIONS/$id';
  }

  static String eventSectionPath(String eventId, String sectionId){
    return '$PATH_EVENTS/$eventId/$PATH_SECTIONS/$sectionId';
  }

  static String sectionPath(String sectionId){
    return '$PATH_SECTIONS/$sectionId';
  }

  static String newsPath(String newsId){
    return '$PATH_NEWS/$newsId';
  }

  static String newsConfirmationPath(String newsId, String confirmationId){
    return '$PATH_NEWS/$newsId/$PATH_CONFIRMATIONS/$confirmationId';
  }

    static String newsSectionPath(String newsId, String sectionId){
    return '$PATH_NEWS/$newsId/$PATH_SECTIONS/$sectionId';
  }

}