// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'by_id_persons_complete.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GByIdPersonCompleteData> _$gByIdPersonCompleteDataSerializer =
    new _$GByIdPersonCompleteDataSerializer();
Serializer<GByIdPersonCompleteData_personById>
    _$gByIdPersonCompleteDataPersonByIdSerializer =
    new _$GByIdPersonCompleteData_personByIdSerializer();

class _$GByIdPersonCompleteDataSerializer
    implements StructuredSerializer<GByIdPersonCompleteData> {
  @override
  final Iterable<Type> types = const [
    GByIdPersonCompleteData,
    _$GByIdPersonCompleteData
  ];
  @override
  final String wireName = 'GByIdPersonCompleteData';

  @override
  Iterable<Object> serialize(
      Serializers serializers, GByIdPersonCompleteData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    if (object.personById != null) {
      result
        ..add('personById')
        ..add(serializers.serialize(object.personById,
            specifiedType: const FullType(GByIdPersonCompleteData_personById)));
    }
    return result;
  }

  @override
  GByIdPersonCompleteData deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GByIdPersonCompleteDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'personById':
          result.personById.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GByIdPersonCompleteData_personById))
              as GByIdPersonCompleteData_personById);
          break;
      }
    }

    return result.build();
  }
}

class _$GByIdPersonCompleteData_personByIdSerializer
    implements StructuredSerializer<GByIdPersonCompleteData_personById> {
  @override
  final Iterable<Type> types = const [
    GByIdPersonCompleteData_personById,
    _$GByIdPersonCompleteData_personById
  ];
  @override
  final String wireName = 'GByIdPersonCompleteData_personById';

  @override
  Iterable<Object> serialize(
      Serializers serializers, GByIdPersonCompleteData_personById object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'tags',
      serializers.serialize(object.tags,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'added',
      serializers.serialize(object.added,
          specifiedType: const FullType(_i2.GNaiveDateTime)),
    ];
    if (object.email != null) {
      result
        ..add('email')
        ..add(serializers.serialize(object.email,
            specifiedType: const FullType(String)));
    }
    if (object.phone != null) {
      result
        ..add('phone')
        ..add(serializers.serialize(object.phone,
            specifiedType: const FullType(String)));
    }
    if (object.changed != null) {
      result
        ..add('changed')
        ..add(serializers.serialize(object.changed,
            specifiedType: const FullType(_i2.GNaiveDateTime)));
    }
    return result;
  }

  @override
  GByIdPersonCompleteData_personById deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GByIdPersonCompleteData_personByIdBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'phone':
          result.phone = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'tags':
          result.tags.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'added':
          result.added.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i2.GNaiveDateTime))
              as _i2.GNaiveDateTime);
          break;
        case 'changed':
          result.changed.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i2.GNaiveDateTime))
              as _i2.GNaiveDateTime);
          break;
      }
    }

    return result.build();
  }
}

class _$GByIdPersonCompleteData extends GByIdPersonCompleteData {
  @override
  final String G__typename;
  @override
  final GByIdPersonCompleteData_personById personById;

  factory _$GByIdPersonCompleteData(
          [void Function(GByIdPersonCompleteDataBuilder) updates]) =>
      (new GByIdPersonCompleteDataBuilder()..update(updates)).build();

  _$GByIdPersonCompleteData._({this.G__typename, this.personById}) : super._() {
    if (G__typename == null) {
      throw new BuiltValueNullFieldError(
          'GByIdPersonCompleteData', 'G__typename');
    }
  }

  @override
  GByIdPersonCompleteData rebuild(
          void Function(GByIdPersonCompleteDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GByIdPersonCompleteDataBuilder toBuilder() =>
      new GByIdPersonCompleteDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GByIdPersonCompleteData &&
        G__typename == other.G__typename &&
        personById == other.personById;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, G__typename.hashCode), personById.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GByIdPersonCompleteData')
          ..add('G__typename', G__typename)
          ..add('personById', personById))
        .toString();
  }
}

class GByIdPersonCompleteDataBuilder
    implements
        Builder<GByIdPersonCompleteData, GByIdPersonCompleteDataBuilder> {
  _$GByIdPersonCompleteData _$v;

  String _G__typename;
  String get G__typename => _$this._G__typename;
  set G__typename(String G__typename) => _$this._G__typename = G__typename;

  GByIdPersonCompleteData_personByIdBuilder _personById;
  GByIdPersonCompleteData_personByIdBuilder get personById =>
      _$this._personById ??= new GByIdPersonCompleteData_personByIdBuilder();
  set personById(GByIdPersonCompleteData_personByIdBuilder personById) =>
      _$this._personById = personById;

  GByIdPersonCompleteDataBuilder() {
    GByIdPersonCompleteData._initializeBuilder(this);
  }

  GByIdPersonCompleteDataBuilder get _$this {
    if (_$v != null) {
      _G__typename = _$v.G__typename;
      _personById = _$v.personById?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GByIdPersonCompleteData other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GByIdPersonCompleteData;
  }

  @override
  void update(void Function(GByIdPersonCompleteDataBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GByIdPersonCompleteData build() {
    _$GByIdPersonCompleteData _$result;
    try {
      _$result = _$v ??
          new _$GByIdPersonCompleteData._(
              G__typename: G__typename, personById: _personById?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'personById';
        _personById?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GByIdPersonCompleteData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GByIdPersonCompleteData_personById
    extends GByIdPersonCompleteData_personById {
  @override
  final String G__typename;
  @override
  final int id;
  @override
  final String name;
  @override
  final String email;
  @override
  final String phone;
  @override
  final BuiltList<String> tags;
  @override
  final _i2.GNaiveDateTime added;
  @override
  final _i2.GNaiveDateTime changed;

  factory _$GByIdPersonCompleteData_personById(
          [void Function(GByIdPersonCompleteData_personByIdBuilder) updates]) =>
      (new GByIdPersonCompleteData_personByIdBuilder()..update(updates))
          .build();

  _$GByIdPersonCompleteData_personById._(
      {this.G__typename,
      this.id,
      this.name,
      this.email,
      this.phone,
      this.tags,
      this.added,
      this.changed})
      : super._() {
    if (G__typename == null) {
      throw new BuiltValueNullFieldError(
          'GByIdPersonCompleteData_personById', 'G__typename');
    }
    if (id == null) {
      throw new BuiltValueNullFieldError(
          'GByIdPersonCompleteData_personById', 'id');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError(
          'GByIdPersonCompleteData_personById', 'name');
    }
    if (tags == null) {
      throw new BuiltValueNullFieldError(
          'GByIdPersonCompleteData_personById', 'tags');
    }
    if (added == null) {
      throw new BuiltValueNullFieldError(
          'GByIdPersonCompleteData_personById', 'added');
    }
  }

  @override
  GByIdPersonCompleteData_personById rebuild(
          void Function(GByIdPersonCompleteData_personByIdBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GByIdPersonCompleteData_personByIdBuilder toBuilder() =>
      new GByIdPersonCompleteData_personByIdBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GByIdPersonCompleteData_personById &&
        G__typename == other.G__typename &&
        id == other.id &&
        name == other.name &&
        email == other.email &&
        phone == other.phone &&
        tags == other.tags &&
        added == other.added &&
        changed == other.changed;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, G__typename.hashCode), id.hashCode),
                            name.hashCode),
                        email.hashCode),
                    phone.hashCode),
                tags.hashCode),
            added.hashCode),
        changed.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GByIdPersonCompleteData_personById')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name)
          ..add('email', email)
          ..add('phone', phone)
          ..add('tags', tags)
          ..add('added', added)
          ..add('changed', changed))
        .toString();
  }
}

class GByIdPersonCompleteData_personByIdBuilder
    implements
        Builder<GByIdPersonCompleteData_personById,
            GByIdPersonCompleteData_personByIdBuilder> {
  _$GByIdPersonCompleteData_personById _$v;

  String _G__typename;
  String get G__typename => _$this._G__typename;
  set G__typename(String G__typename) => _$this._G__typename = G__typename;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _email;
  String get email => _$this._email;
  set email(String email) => _$this._email = email;

  String _phone;
  String get phone => _$this._phone;
  set phone(String phone) => _$this._phone = phone;

  ListBuilder<String> _tags;
  ListBuilder<String> get tags => _$this._tags ??= new ListBuilder<String>();
  set tags(ListBuilder<String> tags) => _$this._tags = tags;

  _i2.GNaiveDateTimeBuilder _added;
  _i2.GNaiveDateTimeBuilder get added =>
      _$this._added ??= new _i2.GNaiveDateTimeBuilder();
  set added(_i2.GNaiveDateTimeBuilder added) => _$this._added = added;

  _i2.GNaiveDateTimeBuilder _changed;
  _i2.GNaiveDateTimeBuilder get changed =>
      _$this._changed ??= new _i2.GNaiveDateTimeBuilder();
  set changed(_i2.GNaiveDateTimeBuilder changed) => _$this._changed = changed;

  GByIdPersonCompleteData_personByIdBuilder() {
    GByIdPersonCompleteData_personById._initializeBuilder(this);
  }

  GByIdPersonCompleteData_personByIdBuilder get _$this {
    if (_$v != null) {
      _G__typename = _$v.G__typename;
      _id = _$v.id;
      _name = _$v.name;
      _email = _$v.email;
      _phone = _$v.phone;
      _tags = _$v.tags?.toBuilder();
      _added = _$v.added?.toBuilder();
      _changed = _$v.changed?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GByIdPersonCompleteData_personById other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GByIdPersonCompleteData_personById;
  }

  @override
  void update(
      void Function(GByIdPersonCompleteData_personByIdBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GByIdPersonCompleteData_personById build() {
    _$GByIdPersonCompleteData_personById _$result;
    try {
      _$result = _$v ??
          new _$GByIdPersonCompleteData_personById._(
              G__typename: G__typename,
              id: id,
              name: name,
              email: email,
              phone: phone,
              tags: tags.build(),
              added: added.build(),
              changed: _changed?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'tags';
        tags.build();
        _$failedField = 'added';
        added.build();
        _$failedField = 'changed';
        _changed?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GByIdPersonCompleteData_personById', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
