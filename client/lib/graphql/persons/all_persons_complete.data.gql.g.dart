// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_persons_complete.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GAllPersonsCompleteData> _$gAllPersonsCompleteDataSerializer =
    new _$GAllPersonsCompleteDataSerializer();
Serializer<GAllPersonsCompleteData_persons>
    _$gAllPersonsCompleteDataPersonsSerializer =
    new _$GAllPersonsCompleteData_personsSerializer();

class _$GAllPersonsCompleteDataSerializer
    implements StructuredSerializer<GAllPersonsCompleteData> {
  @override
  final Iterable<Type> types = const [
    GAllPersonsCompleteData,
    _$GAllPersonsCompleteData
  ];
  @override
  final String wireName = 'GAllPersonsCompleteData';

  @override
  Iterable<Object> serialize(
      Serializers serializers, GAllPersonsCompleteData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'persons',
      serializers.serialize(object.persons,
          specifiedType: const FullType(BuiltList,
              const [const FullType(GAllPersonsCompleteData_persons)])),
    ];

    return result;
  }

  @override
  GAllPersonsCompleteData deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GAllPersonsCompleteDataBuilder();

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
        case 'persons':
          result.persons.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GAllPersonsCompleteData_persons)
              ])) as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$GAllPersonsCompleteData_personsSerializer
    implements StructuredSerializer<GAllPersonsCompleteData_persons> {
  @override
  final Iterable<Type> types = const [
    GAllPersonsCompleteData_persons,
    _$GAllPersonsCompleteData_persons
  ];
  @override
  final String wireName = 'GAllPersonsCompleteData_persons';

  @override
  Iterable<Object> serialize(
      Serializers serializers, GAllPersonsCompleteData_persons object,
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
  GAllPersonsCompleteData_persons deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GAllPersonsCompleteData_personsBuilder();

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

class _$GAllPersonsCompleteData extends GAllPersonsCompleteData {
  @override
  final String G__typename;
  @override
  final BuiltList<GAllPersonsCompleteData_persons> persons;

  factory _$GAllPersonsCompleteData(
          [void Function(GAllPersonsCompleteDataBuilder) updates]) =>
      (new GAllPersonsCompleteDataBuilder()..update(updates)).build();

  _$GAllPersonsCompleteData._({this.G__typename, this.persons}) : super._() {
    if (G__typename == null) {
      throw new BuiltValueNullFieldError(
          'GAllPersonsCompleteData', 'G__typename');
    }
    if (persons == null) {
      throw new BuiltValueNullFieldError('GAllPersonsCompleteData', 'persons');
    }
  }

  @override
  GAllPersonsCompleteData rebuild(
          void Function(GAllPersonsCompleteDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GAllPersonsCompleteDataBuilder toBuilder() =>
      new GAllPersonsCompleteDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GAllPersonsCompleteData &&
        G__typename == other.G__typename &&
        persons == other.persons;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, G__typename.hashCode), persons.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GAllPersonsCompleteData')
          ..add('G__typename', G__typename)
          ..add('persons', persons))
        .toString();
  }
}

class GAllPersonsCompleteDataBuilder
    implements
        Builder<GAllPersonsCompleteData, GAllPersonsCompleteDataBuilder> {
  _$GAllPersonsCompleteData _$v;

  String _G__typename;
  String get G__typename => _$this._G__typename;
  set G__typename(String G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GAllPersonsCompleteData_persons> _persons;
  ListBuilder<GAllPersonsCompleteData_persons> get persons =>
      _$this._persons ??= new ListBuilder<GAllPersonsCompleteData_persons>();
  set persons(ListBuilder<GAllPersonsCompleteData_persons> persons) =>
      _$this._persons = persons;

  GAllPersonsCompleteDataBuilder() {
    GAllPersonsCompleteData._initializeBuilder(this);
  }

  GAllPersonsCompleteDataBuilder get _$this {
    if (_$v != null) {
      _G__typename = _$v.G__typename;
      _persons = _$v.persons?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GAllPersonsCompleteData other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GAllPersonsCompleteData;
  }

  @override
  void update(void Function(GAllPersonsCompleteDataBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GAllPersonsCompleteData build() {
    _$GAllPersonsCompleteData _$result;
    try {
      _$result = _$v ??
          new _$GAllPersonsCompleteData._(
              G__typename: G__typename, persons: persons.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'persons';
        persons.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GAllPersonsCompleteData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GAllPersonsCompleteData_persons
    extends GAllPersonsCompleteData_persons {
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

  factory _$GAllPersonsCompleteData_persons(
          [void Function(GAllPersonsCompleteData_personsBuilder) updates]) =>
      (new GAllPersonsCompleteData_personsBuilder()..update(updates)).build();

  _$GAllPersonsCompleteData_persons._(
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
          'GAllPersonsCompleteData_persons', 'G__typename');
    }
    if (id == null) {
      throw new BuiltValueNullFieldError(
          'GAllPersonsCompleteData_persons', 'id');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError(
          'GAllPersonsCompleteData_persons', 'name');
    }
    if (tags == null) {
      throw new BuiltValueNullFieldError(
          'GAllPersonsCompleteData_persons', 'tags');
    }
    if (added == null) {
      throw new BuiltValueNullFieldError(
          'GAllPersonsCompleteData_persons', 'added');
    }
  }

  @override
  GAllPersonsCompleteData_persons rebuild(
          void Function(GAllPersonsCompleteData_personsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GAllPersonsCompleteData_personsBuilder toBuilder() =>
      new GAllPersonsCompleteData_personsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GAllPersonsCompleteData_persons &&
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
    return (newBuiltValueToStringHelper('GAllPersonsCompleteData_persons')
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

class GAllPersonsCompleteData_personsBuilder
    implements
        Builder<GAllPersonsCompleteData_persons,
            GAllPersonsCompleteData_personsBuilder> {
  _$GAllPersonsCompleteData_persons _$v;

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

  GAllPersonsCompleteData_personsBuilder() {
    GAllPersonsCompleteData_persons._initializeBuilder(this);
  }

  GAllPersonsCompleteData_personsBuilder get _$this {
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
  void replace(GAllPersonsCompleteData_persons other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GAllPersonsCompleteData_persons;
  }

  @override
  void update(void Function(GAllPersonsCompleteData_personsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GAllPersonsCompleteData_persons build() {
    _$GAllPersonsCompleteData_persons _$result;
    try {
      _$result = _$v ??
          new _$GAllPersonsCompleteData_persons._(
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
            'GAllPersonsCompleteData_persons', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
