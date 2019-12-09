// GENERATED CODE - DO NOT MODIFY BY HAND

part of user_section;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UserSection extends UserSection {
  @override
  final String id;
  @override
  final String uid;
  @override
  final String userName;
  @override
  final String sectionId;
  @override
  final String sectionName;

  factory _$UserSection([void Function(UserSectionBuilder) updates]) =>
      (new UserSectionBuilder()..update(updates)).build();

  _$UserSection._(
      {this.id, this.uid, this.userName, this.sectionId, this.sectionName})
      : super._();

  @override
  UserSection rebuild(void Function(UserSectionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserSectionBuilder toBuilder() => new UserSectionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserSection &&
        id == other.id &&
        uid == other.uid &&
        userName == other.userName &&
        sectionId == other.sectionId &&
        sectionName == other.sectionName;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, id.hashCode), uid.hashCode), userName.hashCode),
            sectionId.hashCode),
        sectionName.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UserSection')
          ..add('id', id)
          ..add('uid', uid)
          ..add('userName', userName)
          ..add('sectionId', sectionId)
          ..add('sectionName', sectionName))
        .toString();
  }
}

class UserSectionBuilder implements Builder<UserSection, UserSectionBuilder> {
  _$UserSection _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _uid;
  String get uid => _$this._uid;
  set uid(String uid) => _$this._uid = uid;

  String _userName;
  String get userName => _$this._userName;
  set userName(String userName) => _$this._userName = userName;

  String _sectionId;
  String get sectionId => _$this._sectionId;
  set sectionId(String sectionId) => _$this._sectionId = sectionId;

  String _sectionName;
  String get sectionName => _$this._sectionName;
  set sectionName(String sectionName) => _$this._sectionName = sectionName;

  UserSectionBuilder();

  UserSectionBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _uid = _$v.uid;
      _userName = _$v.userName;
      _sectionId = _$v.sectionId;
      _sectionName = _$v.sectionName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserSection other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$UserSection;
  }

  @override
  void update(void Function(UserSectionBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UserSection build() {
    final _$result = _$v ??
        new _$UserSection._(
            id: id,
            uid: uid,
            userName: userName,
            sectionId: sectionId,
            sectionName: sectionName);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
