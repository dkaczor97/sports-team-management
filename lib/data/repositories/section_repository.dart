import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sports_team_management/data/firestore_path.dart';
import 'package:sports_team_management/data/models/section.dart';
import 'package:sports_team_management/data/models/user_section.dart';

class SectionRepository {
  static const SECTION_NAME = 'name';
  static const SECTION_ID = 'id';
  static const USERSECTION_USERNAME = 'userName';
  static const USERSECTION_USERID = 'uid';
  static const USERSECTION_SECTIONID = 'sectionId';
  static const USERSECTION_SECTIONNAME = 'sectionName';

  FirebaseFirestore firestore;
  SectionRepository(this.firestore);

  Future<List<Section>> loadSections() async {
    final snapshot =
        await firestore.collection(FirestorePaths.PATH_SECTIONS).get();
    final sections = snapshot.docs.map((d) => sectionFromDoc(d)).toList();
    final returnList = <Section>[];
    for (var section in sections) {
      final userSections = await loadUserSectionsBySection(section.id);
      returnList.add(section
          .rebuild((s) => s..users = ListBuilder<UserSection>(userSections)));
    }
    return returnList;
  }

  Future<List<UserSection>> loadUserSectionsByUser(String uid) async {
    final snapshot = await firestore
        .collection(FirestorePaths.PATH_USERSSECTIONS)
        .where(USERSECTION_USERID, isEqualTo: uid)
        .get();
    return snapshot.docs.map((us) => _userSectionFromDoc(us)).toList();
  }

  Future<List<UserSection>> loadUserSectionsBySection(String sectionId) async {
    final snapshot = await firestore
        .collection(FirestorePaths.PATH_USERSSECTIONS)
        .where(USERSECTION_SECTIONID, isEqualTo: sectionId)
        .get();
    return snapshot.docs.map((us) => _userSectionFromDoc(us)).toList();
  }

  Future<void> addUserSection(UserSection userSection) async {
    await firestore
        .collection(FirestorePaths.PATH_USERSSECTIONS)
        .add(_userSectionToMap(userSection));
  }

  Future<void> removeUserSection(String userSectionId) async {
    await firestore.doc(FirestorePaths.userSectionPath(userSectionId)).delete();
  }

  Future<void> editSection(Section section) async {
    await firestore
        .doc(FirestorePaths.sectionPath(section.id))
        .set(sectionToMap(section));
  }

  Future<Section> addSection(Section section) async {
    final documentReference = await firestore
        .collection(FirestorePaths.PATH_SECTIONS)
        .add(sectionToMap(section));
    return sectionFromDoc(await documentReference.get());
  }

  static Section sectionFromDoc(DocumentSnapshot document) {
    return Section((s) => s
      ..id = document.id
      ..name = document[SECTION_NAME]);
  }

  static Map<String, dynamic> sectionToMap(Section section) {
    return {SECTION_ID: section.id, SECTION_NAME: section.name};
  }

  static UserSection _userSectionFromDoc(DocumentSnapshot document) {
    return (UserSection((us) => us
      ..id = document.id
      ..userName = document[USERSECTION_USERNAME]
      ..uid = document[USERSECTION_USERID]
      ..sectionId = document[USERSECTION_SECTIONID]
      ..sectionName = document[USERSECTION_SECTIONNAME]));
  }

  static Map<String, dynamic> _userSectionToMap(UserSection userSection) {
    return {
      USERSECTION_SECTIONID: userSection.sectionId,
      USERSECTION_SECTIONNAME: userSection.sectionName,
      USERSECTION_USERID: userSection.uid,
      USERSECTION_USERNAME: userSection.userName,
    };
  }
}
