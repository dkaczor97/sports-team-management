class FirestorePaths{
  static const PATH_USERS = 'users';
  static const PATH_EVENTS= 'events';

  static String userPath(String userId){
    return '$PATH_USERS/$userId';
  }

  static String eventPath(String eventId){
    return '$PATH_EVENTS/$eventId';
  }
}