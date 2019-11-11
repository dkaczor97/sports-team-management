import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sports_team_management/data/models/user_model.dart';

class UserRepository{
  static const String path = 'users';
  Firestore firestore;
  UserRepository(this.firestore);

  Future<UserEntity> loadUserData(String uid){
    return firestore.collection(path).where(UserFields.uid, isEqualTo: uid).getDocuments().then((onValue){
      var document = onValue.documents[0];
      var user = document.data;
        return UserEntity(
          displayName: user[UserFields.displayName],
          uid: user[UserFields.uid],
          jerseyNumber: user[UserFields.jerseyNumber],
          id: document.documentID
        );
    });
  }

  Future<void> updateUserData(UserEntity userEntity){
    return firestore.collection(path)
    .document(userEntity.id).updateData(userEntity.toJson());
  }
}