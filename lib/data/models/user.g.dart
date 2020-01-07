// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$User extends User {
  @override
  final String uid;
  @override
  final String email;
  @override
  final String name;
  @override
  final int jerseyNumber;
  @override
  final String token;
  @override
  final String role;

  factory _$User([void Function(UserBuilder) updates]) =>
      (new UserBuilder()..update(updates)).build();

  _$User._(
      {this.uid,
      this.email,
      this.name,
      this.jerseyNumber,
      this.token,
      this.role})
      : super._() {
    if (uid == null) {
      throw new BuiltValueNullFieldError('User', 'uid');
    }
    if (email == null) {
      throw new BuiltValueNullFieldError('User', 'email');
    }
  }

  @override
  User rebuild(void Function(UserBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserBuilder toBuilder() => new UserBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is User &&
        uid == other.uid &&
        email == other.email &&
        name == other.name &&
        jerseyNumber == other.jerseyNumber &&
        token == other.token &&
        role == other.role;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc($jc(0, uid.hashCode), email.hashCode), name.hashCode),
                jerseyNumber.hashCode),
            token.hashCode),
        role.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('User')
          ..add('uid', uid)
          ..add('email', email)
          ..add('name', name)
          ..add('jerseyNumber', jerseyNumber)
          ..add('token', token)
          ..add('role', role))
        .toString();
  }
}

class UserBuilder implements Builder<User, UserBuilder> {
  _$User _$v;

  String _uid;
  String get uid => _$this._uid;
  set uid(String uid) => _$this._uid = uid;

  String _email;
  String get email => _$this._email;
  set email(String email) => _$this._email = email;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  int _jerseyNumber;
  int get jerseyNumber => _$this._jerseyNumber;
  set jerseyNumber(int jerseyNumber) => _$this._jerseyNumber = jerseyNumber;

  String _token;
  String get token => _$this._token;
  set token(String token) => _$this._token = token;

  String _role;
  String get role => _$this._role;
  set role(String role) => _$this._role = role;

  UserBuilder();

  UserBuilder get _$this {
    if (_$v != null) {
      _uid = _$v.uid;
      _email = _$v.email;
      _name = _$v.name;
      _jerseyNumber = _$v.jerseyNumber;
      _token = _$v.token;
      _role = _$v.role;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(User other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$User;
  }

  @override
  void update(void Function(UserBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$User build() {
    final _$result = _$v ??
        new _$User._(
            uid: uid,
            email: email,
            name: name,
            jerseyNumber: jerseyNumber,
            token: token,
            role: role);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
