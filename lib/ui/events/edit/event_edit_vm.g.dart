// GENERATED CODE - DO NOT MODIFY BY HAND

part of event_edit_vm;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$EventEditVM extends EventEditVM {
  @override
  final Attendance attendance;
  @override
  final BuiltList sections;

  factory _$EventEditVM([void Function(EventEditVMBuilder) updates]) =>
      (new EventEditVMBuilder()..update(updates)).build();

  _$EventEditVM._({this.attendance, this.sections}) : super._() {
    if (attendance == null) {
      throw new BuiltValueNullFieldError('EventEditVM', 'attendance');
    }
    if (sections == null) {
      throw new BuiltValueNullFieldError('EventEditVM', 'sections');
    }
  }

  @override
  EventEditVM rebuild(void Function(EventEditVMBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EventEditVMBuilder toBuilder() => new EventEditVMBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EventEditVM &&
        attendance == other.attendance &&
        sections == other.sections;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, attendance.hashCode), sections.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('EventEditVM')
          ..add('attendance', attendance)
          ..add('sections', sections))
        .toString();
  }
}

class EventEditVMBuilder implements Builder<EventEditVM, EventEditVMBuilder> {
  _$EventEditVM _$v;

  AttendanceBuilder _attendance;
  AttendanceBuilder get attendance =>
      _$this._attendance ??= new AttendanceBuilder();
  set attendance(AttendanceBuilder attendance) =>
      _$this._attendance = attendance;

  BuiltList _sections;
  BuiltList get sections => _$this._sections;
  set sections(BuiltList sections) => _$this._sections = sections;

  EventEditVMBuilder();

  EventEditVMBuilder get _$this {
    if (_$v != null) {
      _attendance = _$v.attendance?.toBuilder();
      _sections = _$v.sections;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EventEditVM other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$EventEditVM;
  }

  @override
  void update(void Function(EventEditVMBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$EventEditVM build() {
    _$EventEditVM _$result;
    try {
      _$result = _$v ??
          new _$EventEditVM._(
              attendance: attendance.build(), sections: sections);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'attendance';
        attendance.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'EventEditVM', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
