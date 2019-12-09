// GENERATED CODE - DO NOT MODIFY BY HAND

part of news;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$News extends News {
  @override
  final String id;
  @override
  final String title;
  @override
  final String content;
  @override
  final BuiltList<Confirmation> confirmations;
  @override
  final BuiltList<Section> sections;

  factory _$News([void Function(NewsBuilder) updates]) =>
      (new NewsBuilder()..update(updates)).build();

  _$News._(
      {this.id, this.title, this.content, this.confirmations, this.sections})
      : super._();

  @override
  News rebuild(void Function(NewsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NewsBuilder toBuilder() => new NewsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is News &&
        id == other.id &&
        title == other.title &&
        content == other.content &&
        confirmations == other.confirmations &&
        sections == other.sections;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, id.hashCode), title.hashCode), content.hashCode),
            confirmations.hashCode),
        sections.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('News')
          ..add('id', id)
          ..add('title', title)
          ..add('content', content)
          ..add('confirmations', confirmations)
          ..add('sections', sections))
        .toString();
  }
}

class NewsBuilder implements Builder<News, NewsBuilder> {
  _$News _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  String _content;
  String get content => _$this._content;
  set content(String content) => _$this._content = content;

  ListBuilder<Confirmation> _confirmations;
  ListBuilder<Confirmation> get confirmations =>
      _$this._confirmations ??= new ListBuilder<Confirmation>();
  set confirmations(ListBuilder<Confirmation> confirmations) =>
      _$this._confirmations = confirmations;

  ListBuilder<Section> _sections;
  ListBuilder<Section> get sections =>
      _$this._sections ??= new ListBuilder<Section>();
  set sections(ListBuilder<Section> sections) => _$this._sections = sections;

  NewsBuilder();

  NewsBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _title = _$v.title;
      _content = _$v.content;
      _confirmations = _$v.confirmations?.toBuilder();
      _sections = _$v.sections?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(News other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$News;
  }

  @override
  void update(void Function(NewsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$News build() {
    _$News _$result;
    try {
      _$result = _$v ??
          new _$News._(
              id: id,
              title: title,
              content: content,
              confirmations: _confirmations?.build(),
              sections: _sections?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'confirmations';
        _confirmations?.build();
        _$failedField = 'sections';
        _sections?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'News', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
