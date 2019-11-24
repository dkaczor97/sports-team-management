// GENERATED CODE - DO NOT MODIFY BY HAND

part of attendance;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Attendance extends Attendance {
  @override
  final String id;
  @override
  final String uid;
  @override
  final String name;
  @override
  final AttendanceStatus status;
  @override
  final String reason;

  factory _$Attendance([void Function(AttendanceBuilder) updates]) =>
      (new AttendanceBuilder()..update(updates)).build();

  _$Attendance._({this.id, this.uid, this.name, this.status, this.reason})
      : super._();

  @override
  Attendance rebuild(void Function(AttendanceBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AttendanceBuilder toBuilder() => new AttendanceBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Attendance &&
        id == other.id &&
        uid == other.uid &&
        name == other.name &&
        status == other.status &&
        reason == other.reason;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, id.hashCode), uid.hashCode), name.hashCode),
            status.hashCode),
        reason.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Attendance')
          ..add('id', id)
          ..add('uid', uid)
          ..add('name', name)
          ..add('status', status)
          ..add('reason', reason))
        .toString();
  }
}

class AttendanceBuilder implements Builder<Attendance, AttendanceBuilder> {
  _$Attendance _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _uid;
  String get uid => _$this._uid;
  set uid(String uid) => _$this._uid = uid;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  AttendanceStatus _status;
  AttendanceStatus get status => _$this._status;
  set status(AttendanceStatus status) => _$this._status = status;

  String _reason;
  String get reason => _$this._reason;
  set reason(String reason) => _$this._reason = reason;

  AttendanceBuilder();

  AttendanceBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _uid = _$v.uid;
      _name = _$v.name;
      _status = _$v.status;
      _reason = _$v.reason;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Attendance other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Attendance;
  }

  @override
  void update(void Function(AttendanceBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Attendance build() {
    final _$result = _$v ??
        new _$Attendance._(
            id: id, uid: uid, name: name, status: status, reason: reason);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
