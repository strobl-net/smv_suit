// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'by_id_persons_complete.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GByIdPersonCompleteVars> _$gByIdPersonCompleteVarsSerializer =
    new _$GByIdPersonCompleteVarsSerializer();

class _$GByIdPersonCompleteVarsSerializer
    implements StructuredSerializer<GByIdPersonCompleteVars> {
  @override
  final Iterable<Type> types = const [
    GByIdPersonCompleteVars,
    _$GByIdPersonCompleteVars
  ];
  @override
  final String wireName = 'GByIdPersonCompleteVars';

  @override
  Iterable<Object> serialize(
      Serializers serializers, GByIdPersonCompleteVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  GByIdPersonCompleteVars deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GByIdPersonCompleteVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$GByIdPersonCompleteVars extends GByIdPersonCompleteVars {
  @override
  final int id;

  factory _$GByIdPersonCompleteVars(
          [void Function(GByIdPersonCompleteVarsBuilder) updates]) =>
      (new GByIdPersonCompleteVarsBuilder()..update(updates)).build();

  _$GByIdPersonCompleteVars._({this.id}) : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('GByIdPersonCompleteVars', 'id');
    }
  }

  @override
  GByIdPersonCompleteVars rebuild(
          void Function(GByIdPersonCompleteVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GByIdPersonCompleteVarsBuilder toBuilder() =>
      new GByIdPersonCompleteVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GByIdPersonCompleteVars && id == other.id;
  }

  @override
  int get hashCode {
    return $jf($jc(0, id.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GByIdPersonCompleteVars')
          ..add('id', id))
        .toString();
  }
}

class GByIdPersonCompleteVarsBuilder
    implements
        Builder<GByIdPersonCompleteVars, GByIdPersonCompleteVarsBuilder> {
  _$GByIdPersonCompleteVars _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  GByIdPersonCompleteVarsBuilder();

  GByIdPersonCompleteVarsBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GByIdPersonCompleteVars other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GByIdPersonCompleteVars;
  }

  @override
  void update(void Function(GByIdPersonCompleteVarsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GByIdPersonCompleteVars build() {
    final _$result = _$v ?? new _$GByIdPersonCompleteVars._(id: id);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
