import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart' show StandardJsonPlugin;
import 'package:client/graphql/persons/all_persons_complete.data.gql.dart'
    show GAllPersonsCompleteData, GAllPersonsCompleteData_persons;
import 'package:client/graphql/persons/all_persons_complete.req.gql.dart'
    show GAllPersonsCompleteReq;
import 'package:client/graphql/persons/all_persons_complete.var.gql.dart'
    show GAllPersonsCompleteVars;
import 'package:client/graphql/persons/by_id_persons_complete.data.gql.dart'
    show GByIdPersonCompleteData, GByIdPersonCompleteData_personById;
import 'package:client/graphql/persons/by_id_persons_complete.req.gql.dart'
    show GByIdPersonCompleteReq;
import 'package:client/graphql/persons/by_id_persons_complete.var.gql.dart'
    show GByIdPersonCompleteVars;
import 'package:client/schema.schema.gql.dart'
    show
        GBranch,
        GCurrency,
        GInputBill,
        GInputDepodraw,
        GInputMoneyNode,
        GInputOrganisation,
        GInputPerson,
        GInputProduct,
        GInputStatementOfAccount,
        GInputTransaction,
        GInputTransactionEntity,
        GNaiveDateTime,
        GUpdateBill,
        GUpdateDepodraw,
        GUpdateMoneyNode,
        GUpdateOrganisation,
        GUpdatePerson,
        GUpdateProduct,
        GUpdateStatementOfAccount,
        GUpdateTransaction,
        GUpdateTransactionEntity;
import 'package:gql_code_builder/src/serializers/operation_serializer.dart'
    show OperationSerializer;

part 'serializers.gql.g.dart';

final SerializersBuilder _serializersBuilder = _$serializers.toBuilder()
  ..add(OperationSerializer())
  ..addPlugin(StandardJsonPlugin());
@SerializersFor([
  GAllPersonsCompleteData,
  GAllPersonsCompleteData_persons,
  GAllPersonsCompleteReq,
  GAllPersonsCompleteVars,
  GBranch,
  GByIdPersonCompleteData,
  GByIdPersonCompleteData_personById,
  GByIdPersonCompleteReq,
  GByIdPersonCompleteVars,
  GCurrency,
  GInputBill,
  GInputDepodraw,
  GInputMoneyNode,
  GInputOrganisation,
  GInputPerson,
  GInputProduct,
  GInputStatementOfAccount,
  GInputTransaction,
  GInputTransactionEntity,
  GNaiveDateTime,
  GUpdateBill,
  GUpdateDepodraw,
  GUpdateMoneyNode,
  GUpdateOrganisation,
  GUpdatePerson,
  GUpdateProduct,
  GUpdateStatementOfAccount,
  GUpdateTransaction,
  GUpdateTransactionEntity
])
final Serializers serializers = _serializersBuilder.build();
