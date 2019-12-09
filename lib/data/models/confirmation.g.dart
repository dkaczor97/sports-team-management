// GENERATED CODE - DO NOT MODIFY BY HAND

part of confirmation;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Confirmation extends Confirmation {
  @override
  final String uid;
  @override
  final String userName;

  factory _$Confirmation([void Function(ConfirmationBuilder) updates]) =>
      (new ConfirmationBuilder()..update(updates)).build();

  _$Confirmation._({this.uid, this.userName}) : super._();

  @override
  Confirmation rebuild(void Function(ConfirmationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ConfirmationBuilder toBuilder() => new ConfirmationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Confirmation &&
        uid == other.uid &&
        userName == other.userName;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, uid.hashCode), userName.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Confirmation')
          ..add('uid', uid)
          ..add('userName', userName))
        .toString();
  }
}

class ConfirmationBuilder
    implements Builder<Confirmation, ConfirmationBuilder> {
  _$Confirmation _$v;

  String _uid;
  String get uid => _$this._uid;
  set uid(String uid) => _$this._uid = uid;

  String _userName;
  String get userName => _$this._userName;
  set userName(String userName) => _$this._userName = userName;

  ConfirmationBuilder();

  ConfirmationBuilder get _$this {
    if (_$v != null) {
      _uid = _$v.uid;
      _userName = _$v.userName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Confirmation other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Confirmation;
  }

  @override
  void update(void Function(ConfirmationBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Confirmation build() {
    final _$result = _$v ?? new _$Confirmation._(uid: uid, userName: userName);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
