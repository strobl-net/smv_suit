// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:client/graphql/persons/all_persons_complete.ast.gql.dart'
    as _i5;
import 'package:client/graphql/persons/all_persons_complete.data.gql.dart'
    as _i2;
import 'package:client/graphql/persons/all_persons_complete.var.gql.dart'
    as _i3;
import 'package:client/serializers.gql.dart' as _i7;
import 'package:ferry/ferry.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:uuid/uuid.dart' as _i6;

part 'all_persons_complete.req.gql.g.dart';

abstract class GAllPersonsCompleteReq
    implements
        Built<GAllPersonsCompleteReq, GAllPersonsCompleteReqBuilder>,
        _i1.OperationRequest<_i2.GAllPersonsCompleteData,
            _i3.GAllPersonsCompleteVars> {
  GAllPersonsCompleteReq._();

  factory GAllPersonsCompleteReq(
          [Function(GAllPersonsCompleteReqBuilder b) updates]) =
      _$GAllPersonsCompleteReq;

  static void _initializeBuilder(GAllPersonsCompleteReqBuilder b) => b
    ..operation = _i4.Operation(
        document: _i5.document, operationName: 'AllPersonsComplete')
    ..requestId = _i6.Uuid().v1();
  _i3.GAllPersonsCompleteVars get vars;
  _i4.Operation get operation;
  _i4.Request get execRequest =>
      _i4.Request(operation: operation, variables: vars.toJson());
  @nullable
  String get requestId;
  @nullable
  @BuiltValueField(serialize: false)
  _i2.GAllPersonsCompleteData Function(
          _i2.GAllPersonsCompleteData, _i2.GAllPersonsCompleteData)
      get updateResult;
  @nullable
  _i2.GAllPersonsCompleteData get optimisticResponse;
  @nullable
  String get updateCacheHandlerKey;
  @nullable
  Map<String, dynamic> get updateCacheHandlerContext;
  @nullable
  _i1.FetchPolicy get fetchPolicy;
  @override
  _i2.GAllPersonsCompleteData parseData(Map<String, dynamic> json) =>
      _i2.GAllPersonsCompleteData.fromJson(json);
  static Serializer<GAllPersonsCompleteReq> get serializer =>
      _$gAllPersonsCompleteReqSerializer;
  Map<String, dynamic> toJson() =>
      _i7.serializers.serializeWith(GAllPersonsCompleteReq.serializer, this);
  static GAllPersonsCompleteReq fromJson(Map<String, dynamic> json) =>
      _i7.serializers.deserializeWith(GAllPersonsCompleteReq.serializer, json);
}
