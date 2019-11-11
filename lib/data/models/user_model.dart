class UserEntity{
  final String id;
  final String uid;
  final String displayName;
  final int jerseyNumber;
  UserEntity({
    this.id,
    this.uid,
    this.displayName,
    this.jerseyNumber
  });



  Map<String, Object> toJson() {
    return{
      UserFields.uid: uid,
      UserFields.displayName: displayName,
      UserFields.jerseyNumber: jerseyNumber
    };
  }


}

class UserFields{
  static const String uid = "uid";
  static const String displayName = 'displayName';
  static const String jerseyNumber = 'jerseyNumber';
}