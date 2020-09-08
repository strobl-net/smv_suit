// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:client/schema.schema.gql.dart' as _i2;
import 'package:client/serializers.gql.dart' as _i1;

part 'all_persons_complete.data.gql.g.dart';

abstract class GAllPersonsCompleteData
    implements Built<GAllPersonsCompleteData, GAllPersonsCompleteDataBuilder> {
  GAllPersonsCompleteData._();

  factory GAllPersonsCompleteData(
          [Function(GAllPersonsCompleteDataBuilder b) updates]) =
      _$GAllPersonsCompleteData;

  static void _initializeBuilder(GAllPersonsCompleteDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GAllPersonsCompleteData_persons> get persons;
  static Serializer<GAllPersonsCompleteData> get serializer =>
      _$gAllPersonsCompleteDataSerializer;
  Map<String, dynamic> toJson() =>
      _i1.serializers.serializeWith(GAllPersonsCompleteData.serializer, this);
  static GAllPersonsCompleteData fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GAllPersonsCompleteData.serializer, json);
}

abstract class GAllPersonsCompleteData_persons
    implements
        Built<GAllPersonsCompleteData_persons,
            GAllPersonsCompleteData_personsBuilder> {
  GAllPersonsCompleteData_persons._();

  factory GAllPersonsCompleteData_persons(
          [Function(GAllPersonsCompleteData_personsBuilder b) updates]) =
      _$GAllPersonsCompleteData_persons;

  static void _initializeBuilder(GAllPersonsCompleteData_personsBuilder b) =>
      b..G__typename = 'Person';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int get id;
  String get name;
  @nullable
  String get email;
  @nullable
  String get phone;
  BuiltList<String> get tags;
  _i2.GNaiveDateTime get added;
  @nullable
  _i2.GNaiveDateTime get changed;
  static Serializer<GAllPersonsCompleteData_persons> get serializer =>
      _$gAllPersonsCompleteDataPersonsSerializer;
  Map<String, dynamic> toJson() => _i1.serializers
      .serializeWith(GAllPersonsCompleteData_persons.serializer, this);
  static GAllPersonsCompleteData_persons fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GAllPersonsCompleteData_persons.serializer, json);
}
