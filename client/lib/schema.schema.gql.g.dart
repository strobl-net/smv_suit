// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schema.schema.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const GBranch _$gBranchDIGITAL = const GBranch._('DIGITAL');
const GBranch _$gBranchCASH = const GBranch._('CASH');

GBranch _$gBranchValueOf(String name) {
  switch (name) {
    case 'DIGITAL':
      return _$gBranchDIGITAL;
    case 'CASH':
      return _$gBranchCASH;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<GBranch> _$gBranchValues = new BuiltSet<GBranch>(const <GBranch>[
  _$gBranchDIGITAL,
  _$gBranchCASH,
]);

const GCurrency _$gCurrencyEUR = const GCurrency._('EUR');
const GCurrency _$gCurrencyUSD = const GCurrency._('USD');

GCurrency _$gCurrencyValueOf(String name) {
  switch (name) {
    case 'EUR':
      return _$gCurrencyEUR;
    case 'USD':
      return _$gCurrencyUSD;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<GCurrency> _$gCurrencyValues =
    new BuiltSet<GCurrency>(const <GCurrency>[
  _$gCurrencyEUR,
  _$gCurrencyUSD,
]);

Serializer<GBranch> _$gBranchSerializer = new _$GBranchSerializer();
Serializer<GCurrency> _$gCurrencySerializer = new _$GCurrencySerializer();
Serializer<GInputBill> _$gInputBillSerializer = new _$GInputBillSerializer();
Serializer<GInputDepodraw> _$gInputDepodrawSerializer =
    new _$GInputDepodrawSerializer();
Serializer<GInputMoneyNode> _$gInputMoneyNodeSerializer =
    new _$GInputMoneyNodeSerializer();
Serializer<GInputOrganisation> _$gInputOrganisationSerializer =
    new _$GInputOrganisationSerializer();
Serializer<GInputPerson> _$gInputPersonSerializer =
    new _$GInputPersonSerializer();
Serializer<GInputProduct> _$gInputProductSerializer =
    new _$GInputProductSerializer();
Serializer<GInputStatementOfAccount> _$gInputStatementOfAccountSerializer =
    new _$GInputStatementOfAccountSerializer();
Serializer<GInputTransaction> _$gInputTransactionSerializer =
    new _$GInputTransactionSerializer();
Serializer<GInputTransactionEntity> _$gInputTransactionEntitySerializer =
    new _$GInputTransactionEntitySerializer();
Serializer<GUpdateBill> _$gUpdateBillSerializer = new _$GUpdateBillSerializer();
Serializer<GUpdateDepodraw> _$gUpdateDepodrawSerializer =
    new _$GUpdateDepodrawSerializer();
Serializer<GUpdateMoneyNode> _$gUpdateMoneyNodeSerializer =
    new _$GUpdateMoneyNodeSerializer();
Serializer<GUpdateOrganisation> _$gUpdateOrganisationSerializer =
    new _$GUpdateOrganisationSerializer();
Serializer<GUpdatePerson> _$gUpdatePersonSerializer =
    new _$GUpdatePersonSerializer();
Serializer<GUpdateProduct> _$gUpdateProductSerializer =
    new _$GUpdateProductSerializer();
Serializer<GUpdateStatementOfAccount> _$gUpdateStatementOfAccountSerializer =
    new _$GUpdateStatementOfAccountSerializer();
Serializer<GUpdateTransaction> _$gUpdateTransactionSerializer =
    new _$GUpdateTransactionSerializer();
Serializer<GUpdateTransactionEntity> _$gUpdateTransactionEntitySerializer =
    new _$GUpdateTransactionEntitySerializer();

class _$GBranchSerializer implements PrimitiveSerializer<GBranch> {
  @override
  final Iterable<Type> types = const <Type>[GBranch];
  @override
  final String wireName = 'GBranch';

  @override
  Object serialize(Serializers serializers, GBranch object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  GBranch deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      GBranch.valueOf(serialized as String);
}

class _$GCurrencySerializer implements PrimitiveSerializer<GCurrency> {
  @override
  final Iterable<Type> types = const <Type>[GCurrency];
  @override
  final String wireName = 'GCurrency';

  @override
  Object serialize(Serializers serializers, GCurrency object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  GCurrency deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      GCurrency.valueOf(serialized as String);
}

class _$GInputBillSerializer implements StructuredSerializer<GInputBill> {
  @override
  final Iterable<Type> types = const [GInputBill, _$GInputBill];
  @override
  final String wireName = 'GInputBill';

  @override
  Iterable<Object> serialize(Serializers serializers, GInputBill object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'received',
      serializers.serialize(object.received,
          specifiedType: const FullType(GNaiveDateTime)),
      'products',
      serializers.serialize(object.products,
          specifiedType:
              const FullType(BuiltList, const [const FullType(int)])),
      'transaction',
      serializers.serialize(object.transaction,
          specifiedType: const FullType(int)),
    ];
    if (object.processed != null) {
      result
        ..add('processed')
        ..add(serializers.serialize(object.processed,
            specifiedType: const FullType(GNaiveDateTime)));
    }
    if (object.responsible != null) {
      result
        ..add('responsible')
        ..add(serializers.serialize(object.responsible,
            specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  GInputBill deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GInputBillBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'received':
          result.received.replace(serializers.deserialize(value,
              specifiedType: const FullType(GNaiveDateTime)) as GNaiveDateTime);
          break;
        case 'processed':
          result.processed.replace(serializers.deserialize(value,
              specifiedType: const FullType(GNaiveDateTime)) as GNaiveDateTime);
          break;
        case 'products':
          result.products.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))
              as BuiltList<Object>);
          break;
        case 'responsible':
          result.responsible = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'transaction':
          result.transaction = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$GInputDepodrawSerializer
    implements StructuredSerializer<GInputDepodraw> {
  @override
  final Iterable<Type> types = const [GInputDepodraw, _$GInputDepodraw];
  @override
  final String wireName = 'GInputDepodraw';

  @override
  Iterable<Object> serialize(Serializers serializers, GInputDepodraw object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'transactionUp',
      serializers.serialize(object.transactionUp,
          specifiedType: const FullType(int)),
      'transactionDown',
      serializers.serialize(object.transactionDown,
          specifiedType: const FullType(int)),
    ];
    if (object.description != null) {
      result
        ..add('description')
        ..add(serializers.serialize(object.description,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GInputDepodraw deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GInputDepodrawBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'transactionUp':
          result.transactionUp = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'transactionDown':
          result.transactionDown = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$GInputMoneyNodeSerializer
    implements StructuredSerializer<GInputMoneyNode> {
  @override
  final Iterable<Type> types = const [GInputMoneyNode, _$GInputMoneyNode];
  @override
  final String wireName = 'GInputMoneyNode';

  @override
  Iterable<Object> serialize(Serializers serializers, GInputMoneyNode object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'branch',
      serializers.serialize(object.branch,
          specifiedType: const FullType(GBranch)),
      'change',
      serializers.serialize(object.change, specifiedType: const FullType(int)),
      'currency',
      serializers.serialize(object.currency,
          specifiedType: const FullType(GCurrency)),
      'processed',
      serializers.serialize(object.processed,
          specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  GInputMoneyNode deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GInputMoneyNodeBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'branch':
          result.branch = serializers.deserialize(value,
              specifiedType: const FullType(GBranch)) as GBranch;
          break;
        case 'change':
          result.change = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'currency':
          result.currency = serializers.deserialize(value,
              specifiedType: const FullType(GCurrency)) as GCurrency;
          break;
        case 'processed':
          result.processed = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$GInputOrganisationSerializer
    implements StructuredSerializer<GInputOrganisation> {
  @override
  final Iterable<Type> types = const [GInputOrganisation, _$GInputOrganisation];
  @override
  final String wireName = 'GInputOrganisation';

  @override
  Iterable<Object> serialize(Serializers serializers, GInputOrganisation object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];
    if (object.description != null) {
      result
        ..add('description')
        ..add(serializers.serialize(object.description,
            specifiedType: const FullType(String)));
    }
    if (object.site != null) {
      result
        ..add('site')
        ..add(serializers.serialize(object.site,
            specifiedType: const FullType(String)));
    }
    if (object.location != null) {
      result
        ..add('location')
        ..add(serializers.serialize(object.location,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GInputOrganisation deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GInputOrganisationBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'site':
          result.site = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'location':
          result.location = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GInputPersonSerializer implements StructuredSerializer<GInputPerson> {
  @override
  final Iterable<Type> types = const [GInputPerson, _$GInputPerson];
  @override
  final String wireName = 'GInputPerson';

  @override
  Iterable<Object> serialize(Serializers serializers, GInputPerson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'tags',
      serializers.serialize(object.tags,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
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
    return result;
  }

  @override
  GInputPerson deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GInputPersonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
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
      }
    }

    return result.build();
  }
}

class _$GInputProductSerializer implements StructuredSerializer<GInputProduct> {
  @override
  final Iterable<Type> types = const [GInputProduct, _$GInputProduct];
  @override
  final String wireName = 'GInputProduct';

  @override
  Iterable<Object> serialize(Serializers serializers, GInputProduct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'tags',
      serializers.serialize(object.tags,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
    ];
    if (object.description != null) {
      result
        ..add('description')
        ..add(serializers.serialize(object.description,
            specifiedType: const FullType(String)));
    }
    if (object.change != null) {
      result
        ..add('change')
        ..add(serializers.serialize(object.change,
            specifiedType: const FullType(int)));
    }
    if (object.currency != null) {
      result
        ..add('currency')
        ..add(serializers.serialize(object.currency,
            specifiedType: const FullType(GCurrency)));
    }
    if (object.provider != null) {
      result
        ..add('provider')
        ..add(serializers.serialize(object.provider,
            specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  GInputProduct deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GInputProductBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'change':
          result.change = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'currency':
          result.currency = serializers.deserialize(value,
              specifiedType: const FullType(GCurrency)) as GCurrency;
          break;
        case 'provider':
          result.provider = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'tags':
          result.tags.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$GInputStatementOfAccountSerializer
    implements StructuredSerializer<GInputStatementOfAccount> {
  @override
  final Iterable<Type> types = const [
    GInputStatementOfAccount,
    _$GInputStatementOfAccount
  ];
  @override
  final String wireName = 'GInputStatementOfAccount';

  @override
  Iterable<Object> serialize(
      Serializers serializers, GInputStatementOfAccount object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'starting',
      serializers.serialize(object.starting,
          specifiedType: const FullType(GNaiveDateTime)),
      'ending',
      serializers.serialize(object.ending,
          specifiedType: const FullType(GNaiveDateTime)),
    ];
    if (object.description != null) {
      result
        ..add('description')
        ..add(serializers.serialize(object.description,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GInputStatementOfAccount deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GInputStatementOfAccountBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'starting':
          result.starting.replace(serializers.deserialize(value,
              specifiedType: const FullType(GNaiveDateTime)) as GNaiveDateTime);
          break;
        case 'ending':
          result.ending.replace(serializers.deserialize(value,
              specifiedType: const FullType(GNaiveDateTime)) as GNaiveDateTime);
          break;
      }
    }

    return result.build();
  }
}

class _$GInputTransactionSerializer
    implements StructuredSerializer<GInputTransaction> {
  @override
  final Iterable<Type> types = const [GInputTransaction, _$GInputTransaction];
  @override
  final String wireName = 'GInputTransaction';

  @override
  Iterable<Object> serialize(Serializers serializers, GInputTransaction object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'sender',
      serializers.serialize(object.sender, specifiedType: const FullType(int)),
      'senderLocal',
      serializers.serialize(object.senderLocal,
          specifiedType: const FullType(bool)),
      'receiver',
      serializers.serialize(object.receiver,
          specifiedType: const FullType(int)),
      'receiverLocal',
      serializers.serialize(object.receiverLocal,
          specifiedType: const FullType(bool)),
      'moneyNode',
      serializers.serialize(object.moneyNode,
          specifiedType: const FullType(int)),
    ];
    if (object.description != null) {
      result
        ..add('description')
        ..add(serializers.serialize(object.description,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GInputTransaction deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GInputTransactionBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'sender':
          result.sender = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'senderLocal':
          result.senderLocal = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'receiver':
          result.receiver = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'receiverLocal':
          result.receiverLocal = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'moneyNode':
          result.moneyNode = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$GInputTransactionEntitySerializer
    implements StructuredSerializer<GInputTransactionEntity> {
  @override
  final Iterable<Type> types = const [
    GInputTransactionEntity,
    _$GInputTransactionEntity
  ];
  @override
  final String wireName = 'GInputTransactionEntity';

  @override
  Iterable<Object> serialize(
      Serializers serializers, GInputTransactionEntity object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.description != null) {
      result
        ..add('description')
        ..add(serializers.serialize(object.description,
            specifiedType: const FullType(String)));
    }
    if (object.organisation != null) {
      result
        ..add('organisation')
        ..add(serializers.serialize(object.organisation,
            specifiedType: const FullType(int)));
    }
    if (object.person != null) {
      result
        ..add('person')
        ..add(serializers.serialize(object.person,
            specifiedType: const FullType(int)));
    }
    if (object.iban != null) {
      result
        ..add('iban')
        ..add(serializers.serialize(object.iban,
            specifiedType: const FullType(String)));
    }
    if (object.bic != null) {
      result
        ..add('bic')
        ..add(serializers.serialize(object.bic,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GInputTransactionEntity deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GInputTransactionEntityBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'organisation':
          result.organisation = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'person':
          result.person = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'iban':
          result.iban = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'bic':
          result.bic = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GUpdateBillSerializer implements StructuredSerializer<GUpdateBill> {
  @override
  final Iterable<Type> types = const [GUpdateBill, _$GUpdateBill];
  @override
  final String wireName = 'GUpdateBill';

  @override
  Iterable<Object> serialize(Serializers serializers, GUpdateBill object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'products',
      serializers.serialize(object.products,
          specifiedType:
              const FullType(BuiltList, const [const FullType(int)])),
    ];
    if (object.received != null) {
      result
        ..add('received')
        ..add(serializers.serialize(object.received,
            specifiedType: const FullType(GNaiveDateTime)));
    }
    if (object.processed != null) {
      result
        ..add('processed')
        ..add(serializers.serialize(object.processed,
            specifiedType: const FullType(GNaiveDateTime)));
    }
    if (object.responsible != null) {
      result
        ..add('responsible')
        ..add(serializers.serialize(object.responsible,
            specifiedType: const FullType(int)));
    }
    if (object.transaction != null) {
      result
        ..add('transaction')
        ..add(serializers.serialize(object.transaction,
            specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  GUpdateBill deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUpdateBillBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'received':
          result.received.replace(serializers.deserialize(value,
              specifiedType: const FullType(GNaiveDateTime)) as GNaiveDateTime);
          break;
        case 'processed':
          result.processed.replace(serializers.deserialize(value,
              specifiedType: const FullType(GNaiveDateTime)) as GNaiveDateTime);
          break;
        case 'products':
          result.products.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))
              as BuiltList<Object>);
          break;
        case 'responsible':
          result.responsible = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'transaction':
          result.transaction = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$GUpdateDepodrawSerializer
    implements StructuredSerializer<GUpdateDepodraw> {
  @override
  final Iterable<Type> types = const [GUpdateDepodraw, _$GUpdateDepodraw];
  @override
  final String wireName = 'GUpdateDepodraw';

  @override
  Iterable<Object> serialize(Serializers serializers, GUpdateDepodraw object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.description != null) {
      result
        ..add('description')
        ..add(serializers.serialize(object.description,
            specifiedType: const FullType(String)));
    }
    if (object.transactionUp != null) {
      result
        ..add('transactionUp')
        ..add(serializers.serialize(object.transactionUp,
            specifiedType: const FullType(int)));
    }
    if (object.transactionDown != null) {
      result
        ..add('transactionDown')
        ..add(serializers.serialize(object.transactionDown,
            specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  GUpdateDepodraw deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUpdateDepodrawBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'transactionUp':
          result.transactionUp = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'transactionDown':
          result.transactionDown = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$GUpdateMoneyNodeSerializer
    implements StructuredSerializer<GUpdateMoneyNode> {
  @override
  final Iterable<Type> types = const [GUpdateMoneyNode, _$GUpdateMoneyNode];
  @override
  final String wireName = 'GUpdateMoneyNode';

  @override
  Iterable<Object> serialize(Serializers serializers, GUpdateMoneyNode object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.branch != null) {
      result
        ..add('branch')
        ..add(serializers.serialize(object.branch,
            specifiedType: const FullType(GBranch)));
    }
    if (object.change != null) {
      result
        ..add('change')
        ..add(serializers.serialize(object.change,
            specifiedType: const FullType(int)));
    }
    if (object.currency != null) {
      result
        ..add('currency')
        ..add(serializers.serialize(object.currency,
            specifiedType: const FullType(GCurrency)));
    }
    if (object.processed != null) {
      result
        ..add('processed')
        ..add(serializers.serialize(object.processed,
            specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  GUpdateMoneyNode deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUpdateMoneyNodeBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'branch':
          result.branch = serializers.deserialize(value,
              specifiedType: const FullType(GBranch)) as GBranch;
          break;
        case 'change':
          result.change = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'currency':
          result.currency = serializers.deserialize(value,
              specifiedType: const FullType(GCurrency)) as GCurrency;
          break;
        case 'processed':
          result.processed = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$GUpdateOrganisationSerializer
    implements StructuredSerializer<GUpdateOrganisation> {
  @override
  final Iterable<Type> types = const [
    GUpdateOrganisation,
    _$GUpdateOrganisation
  ];
  @override
  final String wireName = 'GUpdateOrganisation';

  @override
  Iterable<Object> serialize(
      Serializers serializers, GUpdateOrganisation object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.name != null) {
      result
        ..add('name')
        ..add(serializers.serialize(object.name,
            specifiedType: const FullType(String)));
    }
    if (object.description != null) {
      result
        ..add('description')
        ..add(serializers.serialize(object.description,
            specifiedType: const FullType(String)));
    }
    if (object.site != null) {
      result
        ..add('site')
        ..add(serializers.serialize(object.site,
            specifiedType: const FullType(String)));
    }
    if (object.location != null) {
      result
        ..add('location')
        ..add(serializers.serialize(object.location,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GUpdateOrganisation deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUpdateOrganisationBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'site':
          result.site = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'location':
          result.location = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GUpdatePersonSerializer implements StructuredSerializer<GUpdatePerson> {
  @override
  final Iterable<Type> types = const [GUpdatePerson, _$GUpdatePerson];
  @override
  final String wireName = 'GUpdatePerson';

  @override
  Iterable<Object> serialize(Serializers serializers, GUpdatePerson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'tags',
      serializers.serialize(object.tags,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
    ];
    if (object.name != null) {
      result
        ..add('name')
        ..add(serializers.serialize(object.name,
            specifiedType: const FullType(String)));
    }
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
    return result;
  }

  @override
  GUpdatePerson deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUpdatePersonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
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
      }
    }

    return result.build();
  }
}

class _$GUpdateProductSerializer
    implements StructuredSerializer<GUpdateProduct> {
  @override
  final Iterable<Type> types = const [GUpdateProduct, _$GUpdateProduct];
  @override
  final String wireName = 'GUpdateProduct';

  @override
  Iterable<Object> serialize(Serializers serializers, GUpdateProduct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'tags',
      serializers.serialize(object.tags,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
    ];
    if (object.name != null) {
      result
        ..add('name')
        ..add(serializers.serialize(object.name,
            specifiedType: const FullType(String)));
    }
    if (object.description != null) {
      result
        ..add('description')
        ..add(serializers.serialize(object.description,
            specifiedType: const FullType(String)));
    }
    if (object.change != null) {
      result
        ..add('change')
        ..add(serializers.serialize(object.change,
            specifiedType: const FullType(int)));
    }
    if (object.currency != null) {
      result
        ..add('currency')
        ..add(serializers.serialize(object.currency,
            specifiedType: const FullType(GCurrency)));
    }
    if (object.provider != null) {
      result
        ..add('provider')
        ..add(serializers.serialize(object.provider,
            specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  GUpdateProduct deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUpdateProductBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'change':
          result.change = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'currency':
          result.currency = serializers.deserialize(value,
              specifiedType: const FullType(GCurrency)) as GCurrency;
          break;
        case 'provider':
          result.provider = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'tags':
          result.tags.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$GUpdateStatementOfAccountSerializer
    implements StructuredSerializer<GUpdateStatementOfAccount> {
  @override
  final Iterable<Type> types = const [
    GUpdateStatementOfAccount,
    _$GUpdateStatementOfAccount
  ];
  @override
  final String wireName = 'GUpdateStatementOfAccount';

  @override
  Iterable<Object> serialize(
      Serializers serializers, GUpdateStatementOfAccount object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.description != null) {
      result
        ..add('description')
        ..add(serializers.serialize(object.description,
            specifiedType: const FullType(String)));
    }
    if (object.starting != null) {
      result
        ..add('starting')
        ..add(serializers.serialize(object.starting,
            specifiedType: const FullType(GNaiveDateTime)));
    }
    if (object.ending != null) {
      result
        ..add('ending')
        ..add(serializers.serialize(object.ending,
            specifiedType: const FullType(GNaiveDateTime)));
    }
    return result;
  }

  @override
  GUpdateStatementOfAccount deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUpdateStatementOfAccountBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'starting':
          result.starting.replace(serializers.deserialize(value,
              specifiedType: const FullType(GNaiveDateTime)) as GNaiveDateTime);
          break;
        case 'ending':
          result.ending.replace(serializers.deserialize(value,
              specifiedType: const FullType(GNaiveDateTime)) as GNaiveDateTime);
          break;
      }
    }

    return result.build();
  }
}

class _$GUpdateTransactionSerializer
    implements StructuredSerializer<GUpdateTransaction> {
  @override
  final Iterable<Type> types = const [GUpdateTransaction, _$GUpdateTransaction];
  @override
  final String wireName = 'GUpdateTransaction';

  @override
  Iterable<Object> serialize(Serializers serializers, GUpdateTransaction object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.description != null) {
      result
        ..add('description')
        ..add(serializers.serialize(object.description,
            specifiedType: const FullType(String)));
    }
    if (object.sender != null) {
      result
        ..add('sender')
        ..add(serializers.serialize(object.sender,
            specifiedType: const FullType(int)));
    }
    if (object.senderLocal != null) {
      result
        ..add('senderLocal')
        ..add(serializers.serialize(object.senderLocal,
            specifiedType: const FullType(bool)));
    }
    if (object.receiver != null) {
      result
        ..add('receiver')
        ..add(serializers.serialize(object.receiver,
            specifiedType: const FullType(int)));
    }
    if (object.receiverLocal != null) {
      result
        ..add('receiverLocal')
        ..add(serializers.serialize(object.receiverLocal,
            specifiedType: const FullType(bool)));
    }
    if (object.moneyNode != null) {
      result
        ..add('moneyNode')
        ..add(serializers.serialize(object.moneyNode,
            specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  GUpdateTransaction deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUpdateTransactionBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'sender':
          result.sender = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'senderLocal':
          result.senderLocal = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'receiver':
          result.receiver = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'receiverLocal':
          result.receiverLocal = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'moneyNode':
          result.moneyNode = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$GUpdateTransactionEntitySerializer
    implements StructuredSerializer<GUpdateTransactionEntity> {
  @override
  final Iterable<Type> types = const [
    GUpdateTransactionEntity,
    _$GUpdateTransactionEntity
  ];
  @override
  final String wireName = 'GUpdateTransactionEntity';

  @override
  Iterable<Object> serialize(
      Serializers serializers, GUpdateTransactionEntity object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.description != null) {
      result
        ..add('description')
        ..add(serializers.serialize(object.description,
            specifiedType: const FullType(String)));
    }
    if (object.organisation != null) {
      result
        ..add('organisation')
        ..add(serializers.serialize(object.organisation,
            specifiedType: const FullType(int)));
    }
    if (object.person != null) {
      result
        ..add('person')
        ..add(serializers.serialize(object.person,
            specifiedType: const FullType(int)));
    }
    if (object.iban != null) {
      result
        ..add('iban')
        ..add(serializers.serialize(object.iban,
            specifiedType: const FullType(String)));
    }
    if (object.bic != null) {
      result
        ..add('bic')
        ..add(serializers.serialize(object.bic,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GUpdateTransactionEntity deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUpdateTransactionEntityBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'organisation':
          result.organisation = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'person':
          result.person = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'iban':
          result.iban = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'bic':
          result.bic = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GInputBill extends GInputBill {
  @override
  final GNaiveDateTime received;
  @override
  final GNaiveDateTime processed;
  @override
  final BuiltList<int> products;
  @override
  final int responsible;
  @override
  final int transaction;

  factory _$GInputBill([void Function(GInputBillBuilder) updates]) =>
      (new GInputBillBuilder()..update(updates)).build();

  _$GInputBill._(
      {this.received,
      this.processed,
      this.products,
      this.responsible,
      this.transaction})
      : super._() {
    if (received == null) {
      throw new BuiltValueNullFieldError('GInputBill', 'received');
    }
    if (products == null) {
      throw new BuiltValueNullFieldError('GInputBill', 'products');
    }
    if (transaction == null) {
      throw new BuiltValueNullFieldError('GInputBill', 'transaction');
    }
  }

  @override
  GInputBill rebuild(void Function(GInputBillBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GInputBillBuilder toBuilder() => new GInputBillBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GInputBill &&
        received == other.received &&
        processed == other.processed &&
        products == other.products &&
        responsible == other.responsible &&
        transaction == other.transaction;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, received.hashCode), processed.hashCode),
                products.hashCode),
            responsible.hashCode),
        transaction.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GInputBill')
          ..add('received', received)
          ..add('processed', processed)
          ..add('products', products)
          ..add('responsible', responsible)
          ..add('transaction', transaction))
        .toString();
  }
}

class GInputBillBuilder implements Builder<GInputBill, GInputBillBuilder> {
  _$GInputBill _$v;

  GNaiveDateTimeBuilder _received;
  GNaiveDateTimeBuilder get received =>
      _$this._received ??= new GNaiveDateTimeBuilder();
  set received(GNaiveDateTimeBuilder received) => _$this._received = received;

  GNaiveDateTimeBuilder _processed;
  GNaiveDateTimeBuilder get processed =>
      _$this._processed ??= new GNaiveDateTimeBuilder();
  set processed(GNaiveDateTimeBuilder processed) =>
      _$this._processed = processed;

  ListBuilder<int> _products;
  ListBuilder<int> get products => _$this._products ??= new ListBuilder<int>();
  set products(ListBuilder<int> products) => _$this._products = products;

  int _responsible;
  int get responsible => _$this._responsible;
  set responsible(int responsible) => _$this._responsible = responsible;

  int _transaction;
  int get transaction => _$this._transaction;
  set transaction(int transaction) => _$this._transaction = transaction;

  GInputBillBuilder();

  GInputBillBuilder get _$this {
    if (_$v != null) {
      _received = _$v.received?.toBuilder();
      _processed = _$v.processed?.toBuilder();
      _products = _$v.products?.toBuilder();
      _responsible = _$v.responsible;
      _transaction = _$v.transaction;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GInputBill other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GInputBill;
  }

  @override
  void update(void Function(GInputBillBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GInputBill build() {
    _$GInputBill _$result;
    try {
      _$result = _$v ??
          new _$GInputBill._(
              received: received.build(),
              processed: _processed?.build(),
              products: products.build(),
              responsible: responsible,
              transaction: transaction);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'received';
        received.build();
        _$failedField = 'processed';
        _processed?.build();
        _$failedField = 'products';
        products.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GInputBill', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GInputDepodraw extends GInputDepodraw {
  @override
  final String description;
  @override
  final int transactionUp;
  @override
  final int transactionDown;

  factory _$GInputDepodraw([void Function(GInputDepodrawBuilder) updates]) =>
      (new GInputDepodrawBuilder()..update(updates)).build();

  _$GInputDepodraw._(
      {this.description, this.transactionUp, this.transactionDown})
      : super._() {
    if (transactionUp == null) {
      throw new BuiltValueNullFieldError('GInputDepodraw', 'transactionUp');
    }
    if (transactionDown == null) {
      throw new BuiltValueNullFieldError('GInputDepodraw', 'transactionDown');
    }
  }

  @override
  GInputDepodraw rebuild(void Function(GInputDepodrawBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GInputDepodrawBuilder toBuilder() =>
      new GInputDepodrawBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GInputDepodraw &&
        description == other.description &&
        transactionUp == other.transactionUp &&
        transactionDown == other.transactionDown;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, description.hashCode), transactionUp.hashCode),
        transactionDown.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GInputDepodraw')
          ..add('description', description)
          ..add('transactionUp', transactionUp)
          ..add('transactionDown', transactionDown))
        .toString();
  }
}

class GInputDepodrawBuilder
    implements Builder<GInputDepodraw, GInputDepodrawBuilder> {
  _$GInputDepodraw _$v;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  int _transactionUp;
  int get transactionUp => _$this._transactionUp;
  set transactionUp(int transactionUp) => _$this._transactionUp = transactionUp;

  int _transactionDown;
  int get transactionDown => _$this._transactionDown;
  set transactionDown(int transactionDown) =>
      _$this._transactionDown = transactionDown;

  GInputDepodrawBuilder();

  GInputDepodrawBuilder get _$this {
    if (_$v != null) {
      _description = _$v.description;
      _transactionUp = _$v.transactionUp;
      _transactionDown = _$v.transactionDown;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GInputDepodraw other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GInputDepodraw;
  }

  @override
  void update(void Function(GInputDepodrawBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GInputDepodraw build() {
    final _$result = _$v ??
        new _$GInputDepodraw._(
            description: description,
            transactionUp: transactionUp,
            transactionDown: transactionDown);
    replace(_$result);
    return _$result;
  }
}

class _$GInputMoneyNode extends GInputMoneyNode {
  @override
  final GBranch branch;
  @override
  final int change;
  @override
  final GCurrency currency;
  @override
  final bool processed;

  factory _$GInputMoneyNode([void Function(GInputMoneyNodeBuilder) updates]) =>
      (new GInputMoneyNodeBuilder()..update(updates)).build();

  _$GInputMoneyNode._({this.branch, this.change, this.currency, this.processed})
      : super._() {
    if (branch == null) {
      throw new BuiltValueNullFieldError('GInputMoneyNode', 'branch');
    }
    if (change == null) {
      throw new BuiltValueNullFieldError('GInputMoneyNode', 'change');
    }
    if (currency == null) {
      throw new BuiltValueNullFieldError('GInputMoneyNode', 'currency');
    }
    if (processed == null) {
      throw new BuiltValueNullFieldError('GInputMoneyNode', 'processed');
    }
  }

  @override
  GInputMoneyNode rebuild(void Function(GInputMoneyNodeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GInputMoneyNodeBuilder toBuilder() =>
      new GInputMoneyNodeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GInputMoneyNode &&
        branch == other.branch &&
        change == other.change &&
        currency == other.currency &&
        processed == other.processed;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, branch.hashCode), change.hashCode), currency.hashCode),
        processed.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GInputMoneyNode')
          ..add('branch', branch)
          ..add('change', change)
          ..add('currency', currency)
          ..add('processed', processed))
        .toString();
  }
}

class GInputMoneyNodeBuilder
    implements Builder<GInputMoneyNode, GInputMoneyNodeBuilder> {
  _$GInputMoneyNode _$v;

  GBranch _branch;
  GBranch get branch => _$this._branch;
  set branch(GBranch branch) => _$this._branch = branch;

  int _change;
  int get change => _$this._change;
  set change(int change) => _$this._change = change;

  GCurrency _currency;
  GCurrency get currency => _$this._currency;
  set currency(GCurrency currency) => _$this._currency = currency;

  bool _processed;
  bool get processed => _$this._processed;
  set processed(bool processed) => _$this._processed = processed;

  GInputMoneyNodeBuilder();

  GInputMoneyNodeBuilder get _$this {
    if (_$v != null) {
      _branch = _$v.branch;
      _change = _$v.change;
      _currency = _$v.currency;
      _processed = _$v.processed;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GInputMoneyNode other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GInputMoneyNode;
  }

  @override
  void update(void Function(GInputMoneyNodeBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GInputMoneyNode build() {
    final _$result = _$v ??
        new _$GInputMoneyNode._(
            branch: branch,
            change: change,
            currency: currency,
            processed: processed);
    replace(_$result);
    return _$result;
  }
}

class _$GInputOrganisation extends GInputOrganisation {
  @override
  final String name;
  @override
  final String description;
  @override
  final String site;
  @override
  final String location;

  factory _$GInputOrganisation(
          [void Function(GInputOrganisationBuilder) updates]) =>
      (new GInputOrganisationBuilder()..update(updates)).build();

  _$GInputOrganisation._(
      {this.name, this.description, this.site, this.location})
      : super._() {
    if (name == null) {
      throw new BuiltValueNullFieldError('GInputOrganisation', 'name');
    }
  }

  @override
  GInputOrganisation rebuild(
          void Function(GInputOrganisationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GInputOrganisationBuilder toBuilder() =>
      new GInputOrganisationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GInputOrganisation &&
        name == other.name &&
        description == other.description &&
        site == other.site &&
        location == other.location;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, name.hashCode), description.hashCode), site.hashCode),
        location.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GInputOrganisation')
          ..add('name', name)
          ..add('description', description)
          ..add('site', site)
          ..add('location', location))
        .toString();
  }
}

class GInputOrganisationBuilder
    implements Builder<GInputOrganisation, GInputOrganisationBuilder> {
  _$GInputOrganisation _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  String _site;
  String get site => _$this._site;
  set site(String site) => _$this._site = site;

  String _location;
  String get location => _$this._location;
  set location(String location) => _$this._location = location;

  GInputOrganisationBuilder();

  GInputOrganisationBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _description = _$v.description;
      _site = _$v.site;
      _location = _$v.location;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GInputOrganisation other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GInputOrganisation;
  }

  @override
  void update(void Function(GInputOrganisationBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GInputOrganisation build() {
    final _$result = _$v ??
        new _$GInputOrganisation._(
            name: name,
            description: description,
            site: site,
            location: location);
    replace(_$result);
    return _$result;
  }
}

class _$GInputPerson extends GInputPerson {
  @override
  final String name;
  @override
  final String email;
  @override
  final String phone;
  @override
  final BuiltList<String> tags;

  factory _$GInputPerson([void Function(GInputPersonBuilder) updates]) =>
      (new GInputPersonBuilder()..update(updates)).build();

  _$GInputPerson._({this.name, this.email, this.phone, this.tags}) : super._() {
    if (name == null) {
      throw new BuiltValueNullFieldError('GInputPerson', 'name');
    }
    if (tags == null) {
      throw new BuiltValueNullFieldError('GInputPerson', 'tags');
    }
  }

  @override
  GInputPerson rebuild(void Function(GInputPersonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GInputPersonBuilder toBuilder() => new GInputPersonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GInputPerson &&
        name == other.name &&
        email == other.email &&
        phone == other.phone &&
        tags == other.tags;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, name.hashCode), email.hashCode), phone.hashCode),
        tags.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GInputPerson')
          ..add('name', name)
          ..add('email', email)
          ..add('phone', phone)
          ..add('tags', tags))
        .toString();
  }
}

class GInputPersonBuilder
    implements Builder<GInputPerson, GInputPersonBuilder> {
  _$GInputPerson _$v;

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

  GInputPersonBuilder();

  GInputPersonBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _email = _$v.email;
      _phone = _$v.phone;
      _tags = _$v.tags?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GInputPerson other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GInputPerson;
  }

  @override
  void update(void Function(GInputPersonBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GInputPerson build() {
    _$GInputPerson _$result;
    try {
      _$result = _$v ??
          new _$GInputPerson._(
              name: name, email: email, phone: phone, tags: tags.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'tags';
        tags.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GInputPerson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GInputProduct extends GInputProduct {
  @override
  final String name;
  @override
  final String description;
  @override
  final int change;
  @override
  final GCurrency currency;
  @override
  final int provider;
  @override
  final BuiltList<String> tags;

  factory _$GInputProduct([void Function(GInputProductBuilder) updates]) =>
      (new GInputProductBuilder()..update(updates)).build();

  _$GInputProduct._(
      {this.name,
      this.description,
      this.change,
      this.currency,
      this.provider,
      this.tags})
      : super._() {
    if (name == null) {
      throw new BuiltValueNullFieldError('GInputProduct', 'name');
    }
    if (tags == null) {
      throw new BuiltValueNullFieldError('GInputProduct', 'tags');
    }
  }

  @override
  GInputProduct rebuild(void Function(GInputProductBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GInputProductBuilder toBuilder() => new GInputProductBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GInputProduct &&
        name == other.name &&
        description == other.description &&
        change == other.change &&
        currency == other.currency &&
        provider == other.provider &&
        tags == other.tags;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, name.hashCode), description.hashCode),
                    change.hashCode),
                currency.hashCode),
            provider.hashCode),
        tags.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GInputProduct')
          ..add('name', name)
          ..add('description', description)
          ..add('change', change)
          ..add('currency', currency)
          ..add('provider', provider)
          ..add('tags', tags))
        .toString();
  }
}

class GInputProductBuilder
    implements Builder<GInputProduct, GInputProductBuilder> {
  _$GInputProduct _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  int _change;
  int get change => _$this._change;
  set change(int change) => _$this._change = change;

  GCurrency _currency;
  GCurrency get currency => _$this._currency;
  set currency(GCurrency currency) => _$this._currency = currency;

  int _provider;
  int get provider => _$this._provider;
  set provider(int provider) => _$this._provider = provider;

  ListBuilder<String> _tags;
  ListBuilder<String> get tags => _$this._tags ??= new ListBuilder<String>();
  set tags(ListBuilder<String> tags) => _$this._tags = tags;

  GInputProductBuilder();

  GInputProductBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _description = _$v.description;
      _change = _$v.change;
      _currency = _$v.currency;
      _provider = _$v.provider;
      _tags = _$v.tags?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GInputProduct other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GInputProduct;
  }

  @override
  void update(void Function(GInputProductBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GInputProduct build() {
    _$GInputProduct _$result;
    try {
      _$result = _$v ??
          new _$GInputProduct._(
              name: name,
              description: description,
              change: change,
              currency: currency,
              provider: provider,
              tags: tags.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'tags';
        tags.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GInputProduct', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GInputStatementOfAccount extends GInputStatementOfAccount {
  @override
  final String description;
  @override
  final GNaiveDateTime starting;
  @override
  final GNaiveDateTime ending;

  factory _$GInputStatementOfAccount(
          [void Function(GInputStatementOfAccountBuilder) updates]) =>
      (new GInputStatementOfAccountBuilder()..update(updates)).build();

  _$GInputStatementOfAccount._({this.description, this.starting, this.ending})
      : super._() {
    if (starting == null) {
      throw new BuiltValueNullFieldError(
          'GInputStatementOfAccount', 'starting');
    }
    if (ending == null) {
      throw new BuiltValueNullFieldError('GInputStatementOfAccount', 'ending');
    }
  }

  @override
  GInputStatementOfAccount rebuild(
          void Function(GInputStatementOfAccountBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GInputStatementOfAccountBuilder toBuilder() =>
      new GInputStatementOfAccountBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GInputStatementOfAccount &&
        description == other.description &&
        starting == other.starting &&
        ending == other.ending;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, description.hashCode), starting.hashCode), ending.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GInputStatementOfAccount')
          ..add('description', description)
          ..add('starting', starting)
          ..add('ending', ending))
        .toString();
  }
}

class GInputStatementOfAccountBuilder
    implements
        Builder<GInputStatementOfAccount, GInputStatementOfAccountBuilder> {
  _$GInputStatementOfAccount _$v;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  GNaiveDateTimeBuilder _starting;
  GNaiveDateTimeBuilder get starting =>
      _$this._starting ??= new GNaiveDateTimeBuilder();
  set starting(GNaiveDateTimeBuilder starting) => _$this._starting = starting;

  GNaiveDateTimeBuilder _ending;
  GNaiveDateTimeBuilder get ending =>
      _$this._ending ??= new GNaiveDateTimeBuilder();
  set ending(GNaiveDateTimeBuilder ending) => _$this._ending = ending;

  GInputStatementOfAccountBuilder();

  GInputStatementOfAccountBuilder get _$this {
    if (_$v != null) {
      _description = _$v.description;
      _starting = _$v.starting?.toBuilder();
      _ending = _$v.ending?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GInputStatementOfAccount other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GInputStatementOfAccount;
  }

  @override
  void update(void Function(GInputStatementOfAccountBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GInputStatementOfAccount build() {
    _$GInputStatementOfAccount _$result;
    try {
      _$result = _$v ??
          new _$GInputStatementOfAccount._(
              description: description,
              starting: starting.build(),
              ending: ending.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'starting';
        starting.build();
        _$failedField = 'ending';
        ending.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GInputStatementOfAccount', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GInputTransaction extends GInputTransaction {
  @override
  final String description;
  @override
  final int sender;
  @override
  final bool senderLocal;
  @override
  final int receiver;
  @override
  final bool receiverLocal;
  @override
  final int moneyNode;

  factory _$GInputTransaction(
          [void Function(GInputTransactionBuilder) updates]) =>
      (new GInputTransactionBuilder()..update(updates)).build();

  _$GInputTransaction._(
      {this.description,
      this.sender,
      this.senderLocal,
      this.receiver,
      this.receiverLocal,
      this.moneyNode})
      : super._() {
    if (sender == null) {
      throw new BuiltValueNullFieldError('GInputTransaction', 'sender');
    }
    if (senderLocal == null) {
      throw new BuiltValueNullFieldError('GInputTransaction', 'senderLocal');
    }
    if (receiver == null) {
      throw new BuiltValueNullFieldError('GInputTransaction', 'receiver');
    }
    if (receiverLocal == null) {
      throw new BuiltValueNullFieldError('GInputTransaction', 'receiverLocal');
    }
    if (moneyNode == null) {
      throw new BuiltValueNullFieldError('GInputTransaction', 'moneyNode');
    }
  }

  @override
  GInputTransaction rebuild(void Function(GInputTransactionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GInputTransactionBuilder toBuilder() =>
      new GInputTransactionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GInputTransaction &&
        description == other.description &&
        sender == other.sender &&
        senderLocal == other.senderLocal &&
        receiver == other.receiver &&
        receiverLocal == other.receiverLocal &&
        moneyNode == other.moneyNode;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, description.hashCode), sender.hashCode),
                    senderLocal.hashCode),
                receiver.hashCode),
            receiverLocal.hashCode),
        moneyNode.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GInputTransaction')
          ..add('description', description)
          ..add('sender', sender)
          ..add('senderLocal', senderLocal)
          ..add('receiver', receiver)
          ..add('receiverLocal', receiverLocal)
          ..add('moneyNode', moneyNode))
        .toString();
  }
}

class GInputTransactionBuilder
    implements Builder<GInputTransaction, GInputTransactionBuilder> {
  _$GInputTransaction _$v;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  int _sender;
  int get sender => _$this._sender;
  set sender(int sender) => _$this._sender = sender;

  bool _senderLocal;
  bool get senderLocal => _$this._senderLocal;
  set senderLocal(bool senderLocal) => _$this._senderLocal = senderLocal;

  int _receiver;
  int get receiver => _$this._receiver;
  set receiver(int receiver) => _$this._receiver = receiver;

  bool _receiverLocal;
  bool get receiverLocal => _$this._receiverLocal;
  set receiverLocal(bool receiverLocal) =>
      _$this._receiverLocal = receiverLocal;

  int _moneyNode;
  int get moneyNode => _$this._moneyNode;
  set moneyNode(int moneyNode) => _$this._moneyNode = moneyNode;

  GInputTransactionBuilder();

  GInputTransactionBuilder get _$this {
    if (_$v != null) {
      _description = _$v.description;
      _sender = _$v.sender;
      _senderLocal = _$v.senderLocal;
      _receiver = _$v.receiver;
      _receiverLocal = _$v.receiverLocal;
      _moneyNode = _$v.moneyNode;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GInputTransaction other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GInputTransaction;
  }

  @override
  void update(void Function(GInputTransactionBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GInputTransaction build() {
    final _$result = _$v ??
        new _$GInputTransaction._(
            description: description,
            sender: sender,
            senderLocal: senderLocal,
            receiver: receiver,
            receiverLocal: receiverLocal,
            moneyNode: moneyNode);
    replace(_$result);
    return _$result;
  }
}

class _$GInputTransactionEntity extends GInputTransactionEntity {
  @override
  final String description;
  @override
  final int organisation;
  @override
  final int person;
  @override
  final String iban;
  @override
  final String bic;

  factory _$GInputTransactionEntity(
          [void Function(GInputTransactionEntityBuilder) updates]) =>
      (new GInputTransactionEntityBuilder()..update(updates)).build();

  _$GInputTransactionEntity._(
      {this.description, this.organisation, this.person, this.iban, this.bic})
      : super._();

  @override
  GInputTransactionEntity rebuild(
          void Function(GInputTransactionEntityBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GInputTransactionEntityBuilder toBuilder() =>
      new GInputTransactionEntityBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GInputTransactionEntity &&
        description == other.description &&
        organisation == other.organisation &&
        person == other.person &&
        iban == other.iban &&
        bic == other.bic;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, description.hashCode), organisation.hashCode),
                person.hashCode),
            iban.hashCode),
        bic.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GInputTransactionEntity')
          ..add('description', description)
          ..add('organisation', organisation)
          ..add('person', person)
          ..add('iban', iban)
          ..add('bic', bic))
        .toString();
  }
}

class GInputTransactionEntityBuilder
    implements
        Builder<GInputTransactionEntity, GInputTransactionEntityBuilder> {
  _$GInputTransactionEntity _$v;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  int _organisation;
  int get organisation => _$this._organisation;
  set organisation(int organisation) => _$this._organisation = organisation;

  int _person;
  int get person => _$this._person;
  set person(int person) => _$this._person = person;

  String _iban;
  String get iban => _$this._iban;
  set iban(String iban) => _$this._iban = iban;

  String _bic;
  String get bic => _$this._bic;
  set bic(String bic) => _$this._bic = bic;

  GInputTransactionEntityBuilder();

  GInputTransactionEntityBuilder get _$this {
    if (_$v != null) {
      _description = _$v.description;
      _organisation = _$v.organisation;
      _person = _$v.person;
      _iban = _$v.iban;
      _bic = _$v.bic;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GInputTransactionEntity other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GInputTransactionEntity;
  }

  @override
  void update(void Function(GInputTransactionEntityBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GInputTransactionEntity build() {
    final _$result = _$v ??
        new _$GInputTransactionEntity._(
            description: description,
            organisation: organisation,
            person: person,
            iban: iban,
            bic: bic);
    replace(_$result);
    return _$result;
  }
}

class _$GNaiveDateTime extends GNaiveDateTime {
  @override
  final String value;

  factory _$GNaiveDateTime([void Function(GNaiveDateTimeBuilder) updates]) =>
      (new GNaiveDateTimeBuilder()..update(updates)).build();

  _$GNaiveDateTime._({this.value}) : super._() {
    if (value == null) {
      throw new BuiltValueNullFieldError('GNaiveDateTime', 'value');
    }
  }

  @override
  GNaiveDateTime rebuild(void Function(GNaiveDateTimeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GNaiveDateTimeBuilder toBuilder() =>
      new GNaiveDateTimeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GNaiveDateTime && value == other.value;
  }

  @override
  int get hashCode {
    return $jf($jc(0, value.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GNaiveDateTime')..add('value', value))
        .toString();
  }
}

class GNaiveDateTimeBuilder
    implements Builder<GNaiveDateTime, GNaiveDateTimeBuilder> {
  _$GNaiveDateTime _$v;

  String _value;
  String get value => _$this._value;
  set value(String value) => _$this._value = value;

  GNaiveDateTimeBuilder();

  GNaiveDateTimeBuilder get _$this {
    if (_$v != null) {
      _value = _$v.value;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GNaiveDateTime other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GNaiveDateTime;
  }

  @override
  void update(void Function(GNaiveDateTimeBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GNaiveDateTime build() {
    final _$result = _$v ?? new _$GNaiveDateTime._(value: value);
    replace(_$result);
    return _$result;
  }
}

class _$GUpdateBill extends GUpdateBill {
  @override
  final GNaiveDateTime received;
  @override
  final GNaiveDateTime processed;
  @override
  final BuiltList<int> products;
  @override
  final int responsible;
  @override
  final int transaction;

  factory _$GUpdateBill([void Function(GUpdateBillBuilder) updates]) =>
      (new GUpdateBillBuilder()..update(updates)).build();

  _$GUpdateBill._(
      {this.received,
      this.processed,
      this.products,
      this.responsible,
      this.transaction})
      : super._() {
    if (products == null) {
      throw new BuiltValueNullFieldError('GUpdateBill', 'products');
    }
  }

  @override
  GUpdateBill rebuild(void Function(GUpdateBillBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUpdateBillBuilder toBuilder() => new GUpdateBillBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUpdateBill &&
        received == other.received &&
        processed == other.processed &&
        products == other.products &&
        responsible == other.responsible &&
        transaction == other.transaction;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, received.hashCode), processed.hashCode),
                products.hashCode),
            responsible.hashCode),
        transaction.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GUpdateBill')
          ..add('received', received)
          ..add('processed', processed)
          ..add('products', products)
          ..add('responsible', responsible)
          ..add('transaction', transaction))
        .toString();
  }
}

class GUpdateBillBuilder implements Builder<GUpdateBill, GUpdateBillBuilder> {
  _$GUpdateBill _$v;

  GNaiveDateTimeBuilder _received;
  GNaiveDateTimeBuilder get received =>
      _$this._received ??= new GNaiveDateTimeBuilder();
  set received(GNaiveDateTimeBuilder received) => _$this._received = received;

  GNaiveDateTimeBuilder _processed;
  GNaiveDateTimeBuilder get processed =>
      _$this._processed ??= new GNaiveDateTimeBuilder();
  set processed(GNaiveDateTimeBuilder processed) =>
      _$this._processed = processed;

  ListBuilder<int> _products;
  ListBuilder<int> get products => _$this._products ??= new ListBuilder<int>();
  set products(ListBuilder<int> products) => _$this._products = products;

  int _responsible;
  int get responsible => _$this._responsible;
  set responsible(int responsible) => _$this._responsible = responsible;

  int _transaction;
  int get transaction => _$this._transaction;
  set transaction(int transaction) => _$this._transaction = transaction;

  GUpdateBillBuilder();

  GUpdateBillBuilder get _$this {
    if (_$v != null) {
      _received = _$v.received?.toBuilder();
      _processed = _$v.processed?.toBuilder();
      _products = _$v.products?.toBuilder();
      _responsible = _$v.responsible;
      _transaction = _$v.transaction;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUpdateBill other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GUpdateBill;
  }

  @override
  void update(void Function(GUpdateBillBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GUpdateBill build() {
    _$GUpdateBill _$result;
    try {
      _$result = _$v ??
          new _$GUpdateBill._(
              received: _received?.build(),
              processed: _processed?.build(),
              products: products.build(),
              responsible: responsible,
              transaction: transaction);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'received';
        _received?.build();
        _$failedField = 'processed';
        _processed?.build();
        _$failedField = 'products';
        products.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GUpdateBill', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GUpdateDepodraw extends GUpdateDepodraw {
  @override
  final String description;
  @override
  final int transactionUp;
  @override
  final int transactionDown;

  factory _$GUpdateDepodraw([void Function(GUpdateDepodrawBuilder) updates]) =>
      (new GUpdateDepodrawBuilder()..update(updates)).build();

  _$GUpdateDepodraw._(
      {this.description, this.transactionUp, this.transactionDown})
      : super._();

  @override
  GUpdateDepodraw rebuild(void Function(GUpdateDepodrawBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUpdateDepodrawBuilder toBuilder() =>
      new GUpdateDepodrawBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUpdateDepodraw &&
        description == other.description &&
        transactionUp == other.transactionUp &&
        transactionDown == other.transactionDown;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, description.hashCode), transactionUp.hashCode),
        transactionDown.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GUpdateDepodraw')
          ..add('description', description)
          ..add('transactionUp', transactionUp)
          ..add('transactionDown', transactionDown))
        .toString();
  }
}

class GUpdateDepodrawBuilder
    implements Builder<GUpdateDepodraw, GUpdateDepodrawBuilder> {
  _$GUpdateDepodraw _$v;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  int _transactionUp;
  int get transactionUp => _$this._transactionUp;
  set transactionUp(int transactionUp) => _$this._transactionUp = transactionUp;

  int _transactionDown;
  int get transactionDown => _$this._transactionDown;
  set transactionDown(int transactionDown) =>
      _$this._transactionDown = transactionDown;

  GUpdateDepodrawBuilder();

  GUpdateDepodrawBuilder get _$this {
    if (_$v != null) {
      _description = _$v.description;
      _transactionUp = _$v.transactionUp;
      _transactionDown = _$v.transactionDown;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUpdateDepodraw other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GUpdateDepodraw;
  }

  @override
  void update(void Function(GUpdateDepodrawBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GUpdateDepodraw build() {
    final _$result = _$v ??
        new _$GUpdateDepodraw._(
            description: description,
            transactionUp: transactionUp,
            transactionDown: transactionDown);
    replace(_$result);
    return _$result;
  }
}

class _$GUpdateMoneyNode extends GUpdateMoneyNode {
  @override
  final GBranch branch;
  @override
  final int change;
  @override
  final GCurrency currency;
  @override
  final bool processed;

  factory _$GUpdateMoneyNode(
          [void Function(GUpdateMoneyNodeBuilder) updates]) =>
      (new GUpdateMoneyNodeBuilder()..update(updates)).build();

  _$GUpdateMoneyNode._(
      {this.branch, this.change, this.currency, this.processed})
      : super._();

  @override
  GUpdateMoneyNode rebuild(void Function(GUpdateMoneyNodeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUpdateMoneyNodeBuilder toBuilder() =>
      new GUpdateMoneyNodeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUpdateMoneyNode &&
        branch == other.branch &&
        change == other.change &&
        currency == other.currency &&
        processed == other.processed;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, branch.hashCode), change.hashCode), currency.hashCode),
        processed.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GUpdateMoneyNode')
          ..add('branch', branch)
          ..add('change', change)
          ..add('currency', currency)
          ..add('processed', processed))
        .toString();
  }
}

class GUpdateMoneyNodeBuilder
    implements Builder<GUpdateMoneyNode, GUpdateMoneyNodeBuilder> {
  _$GUpdateMoneyNode _$v;

  GBranch _branch;
  GBranch get branch => _$this._branch;
  set branch(GBranch branch) => _$this._branch = branch;

  int _change;
  int get change => _$this._change;
  set change(int change) => _$this._change = change;

  GCurrency _currency;
  GCurrency get currency => _$this._currency;
  set currency(GCurrency currency) => _$this._currency = currency;

  bool _processed;
  bool get processed => _$this._processed;
  set processed(bool processed) => _$this._processed = processed;

  GUpdateMoneyNodeBuilder();

  GUpdateMoneyNodeBuilder get _$this {
    if (_$v != null) {
      _branch = _$v.branch;
      _change = _$v.change;
      _currency = _$v.currency;
      _processed = _$v.processed;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUpdateMoneyNode other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GUpdateMoneyNode;
  }

  @override
  void update(void Function(GUpdateMoneyNodeBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GUpdateMoneyNode build() {
    final _$result = _$v ??
        new _$GUpdateMoneyNode._(
            branch: branch,
            change: change,
            currency: currency,
            processed: processed);
    replace(_$result);
    return _$result;
  }
}

class _$GUpdateOrganisation extends GUpdateOrganisation {
  @override
  final String name;
  @override
  final String description;
  @override
  final String site;
  @override
  final String location;

  factory _$GUpdateOrganisation(
          [void Function(GUpdateOrganisationBuilder) updates]) =>
      (new GUpdateOrganisationBuilder()..update(updates)).build();

  _$GUpdateOrganisation._(
      {this.name, this.description, this.site, this.location})
      : super._();

  @override
  GUpdateOrganisation rebuild(
          void Function(GUpdateOrganisationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUpdateOrganisationBuilder toBuilder() =>
      new GUpdateOrganisationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUpdateOrganisation &&
        name == other.name &&
        description == other.description &&
        site == other.site &&
        location == other.location;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, name.hashCode), description.hashCode), site.hashCode),
        location.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GUpdateOrganisation')
          ..add('name', name)
          ..add('description', description)
          ..add('site', site)
          ..add('location', location))
        .toString();
  }
}

class GUpdateOrganisationBuilder
    implements Builder<GUpdateOrganisation, GUpdateOrganisationBuilder> {
  _$GUpdateOrganisation _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  String _site;
  String get site => _$this._site;
  set site(String site) => _$this._site = site;

  String _location;
  String get location => _$this._location;
  set location(String location) => _$this._location = location;

  GUpdateOrganisationBuilder();

  GUpdateOrganisationBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _description = _$v.description;
      _site = _$v.site;
      _location = _$v.location;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUpdateOrganisation other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GUpdateOrganisation;
  }

  @override
  void update(void Function(GUpdateOrganisationBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GUpdateOrganisation build() {
    final _$result = _$v ??
        new _$GUpdateOrganisation._(
            name: name,
            description: description,
            site: site,
            location: location);
    replace(_$result);
    return _$result;
  }
}

class _$GUpdatePerson extends GUpdatePerson {
  @override
  final String name;
  @override
  final String email;
  @override
  final String phone;
  @override
  final BuiltList<String> tags;

  factory _$GUpdatePerson([void Function(GUpdatePersonBuilder) updates]) =>
      (new GUpdatePersonBuilder()..update(updates)).build();

  _$GUpdatePerson._({this.name, this.email, this.phone, this.tags})
      : super._() {
    if (tags == null) {
      throw new BuiltValueNullFieldError('GUpdatePerson', 'tags');
    }
  }

  @override
  GUpdatePerson rebuild(void Function(GUpdatePersonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUpdatePersonBuilder toBuilder() => new GUpdatePersonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUpdatePerson &&
        name == other.name &&
        email == other.email &&
        phone == other.phone &&
        tags == other.tags;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, name.hashCode), email.hashCode), phone.hashCode),
        tags.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GUpdatePerson')
          ..add('name', name)
          ..add('email', email)
          ..add('phone', phone)
          ..add('tags', tags))
        .toString();
  }
}

class GUpdatePersonBuilder
    implements Builder<GUpdatePerson, GUpdatePersonBuilder> {
  _$GUpdatePerson _$v;

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

  GUpdatePersonBuilder();

  GUpdatePersonBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _email = _$v.email;
      _phone = _$v.phone;
      _tags = _$v.tags?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUpdatePerson other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GUpdatePerson;
  }

  @override
  void update(void Function(GUpdatePersonBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GUpdatePerson build() {
    _$GUpdatePerson _$result;
    try {
      _$result = _$v ??
          new _$GUpdatePerson._(
              name: name, email: email, phone: phone, tags: tags.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'tags';
        tags.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GUpdatePerson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GUpdateProduct extends GUpdateProduct {
  @override
  final String name;
  @override
  final String description;
  @override
  final int change;
  @override
  final GCurrency currency;
  @override
  final int provider;
  @override
  final BuiltList<String> tags;

  factory _$GUpdateProduct([void Function(GUpdateProductBuilder) updates]) =>
      (new GUpdateProductBuilder()..update(updates)).build();

  _$GUpdateProduct._(
      {this.name,
      this.description,
      this.change,
      this.currency,
      this.provider,
      this.tags})
      : super._() {
    if (tags == null) {
      throw new BuiltValueNullFieldError('GUpdateProduct', 'tags');
    }
  }

  @override
  GUpdateProduct rebuild(void Function(GUpdateProductBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUpdateProductBuilder toBuilder() =>
      new GUpdateProductBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUpdateProduct &&
        name == other.name &&
        description == other.description &&
        change == other.change &&
        currency == other.currency &&
        provider == other.provider &&
        tags == other.tags;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, name.hashCode), description.hashCode),
                    change.hashCode),
                currency.hashCode),
            provider.hashCode),
        tags.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GUpdateProduct')
          ..add('name', name)
          ..add('description', description)
          ..add('change', change)
          ..add('currency', currency)
          ..add('provider', provider)
          ..add('tags', tags))
        .toString();
  }
}

class GUpdateProductBuilder
    implements Builder<GUpdateProduct, GUpdateProductBuilder> {
  _$GUpdateProduct _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  int _change;
  int get change => _$this._change;
  set change(int change) => _$this._change = change;

  GCurrency _currency;
  GCurrency get currency => _$this._currency;
  set currency(GCurrency currency) => _$this._currency = currency;

  int _provider;
  int get provider => _$this._provider;
  set provider(int provider) => _$this._provider = provider;

  ListBuilder<String> _tags;
  ListBuilder<String> get tags => _$this._tags ??= new ListBuilder<String>();
  set tags(ListBuilder<String> tags) => _$this._tags = tags;

  GUpdateProductBuilder();

  GUpdateProductBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _description = _$v.description;
      _change = _$v.change;
      _currency = _$v.currency;
      _provider = _$v.provider;
      _tags = _$v.tags?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUpdateProduct other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GUpdateProduct;
  }

  @override
  void update(void Function(GUpdateProductBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GUpdateProduct build() {
    _$GUpdateProduct _$result;
    try {
      _$result = _$v ??
          new _$GUpdateProduct._(
              name: name,
              description: description,
              change: change,
              currency: currency,
              provider: provider,
              tags: tags.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'tags';
        tags.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GUpdateProduct', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GUpdateStatementOfAccount extends GUpdateStatementOfAccount {
  @override
  final String description;
  @override
  final GNaiveDateTime starting;
  @override
  final GNaiveDateTime ending;

  factory _$GUpdateStatementOfAccount(
          [void Function(GUpdateStatementOfAccountBuilder) updates]) =>
      (new GUpdateStatementOfAccountBuilder()..update(updates)).build();

  _$GUpdateStatementOfAccount._({this.description, this.starting, this.ending})
      : super._();

  @override
  GUpdateStatementOfAccount rebuild(
          void Function(GUpdateStatementOfAccountBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUpdateStatementOfAccountBuilder toBuilder() =>
      new GUpdateStatementOfAccountBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUpdateStatementOfAccount &&
        description == other.description &&
        starting == other.starting &&
        ending == other.ending;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, description.hashCode), starting.hashCode), ending.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GUpdateStatementOfAccount')
          ..add('description', description)
          ..add('starting', starting)
          ..add('ending', ending))
        .toString();
  }
}

class GUpdateStatementOfAccountBuilder
    implements
        Builder<GUpdateStatementOfAccount, GUpdateStatementOfAccountBuilder> {
  _$GUpdateStatementOfAccount _$v;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  GNaiveDateTimeBuilder _starting;
  GNaiveDateTimeBuilder get starting =>
      _$this._starting ??= new GNaiveDateTimeBuilder();
  set starting(GNaiveDateTimeBuilder starting) => _$this._starting = starting;

  GNaiveDateTimeBuilder _ending;
  GNaiveDateTimeBuilder get ending =>
      _$this._ending ??= new GNaiveDateTimeBuilder();
  set ending(GNaiveDateTimeBuilder ending) => _$this._ending = ending;

  GUpdateStatementOfAccountBuilder();

  GUpdateStatementOfAccountBuilder get _$this {
    if (_$v != null) {
      _description = _$v.description;
      _starting = _$v.starting?.toBuilder();
      _ending = _$v.ending?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUpdateStatementOfAccount other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GUpdateStatementOfAccount;
  }

  @override
  void update(void Function(GUpdateStatementOfAccountBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GUpdateStatementOfAccount build() {
    _$GUpdateStatementOfAccount _$result;
    try {
      _$result = _$v ??
          new _$GUpdateStatementOfAccount._(
              description: description,
              starting: _starting?.build(),
              ending: _ending?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'starting';
        _starting?.build();
        _$failedField = 'ending';
        _ending?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GUpdateStatementOfAccount', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GUpdateTransaction extends GUpdateTransaction {
  @override
  final String description;
  @override
  final int sender;
  @override
  final bool senderLocal;
  @override
  final int receiver;
  @override
  final bool receiverLocal;
  @override
  final int moneyNode;

  factory _$GUpdateTransaction(
          [void Function(GUpdateTransactionBuilder) updates]) =>
      (new GUpdateTransactionBuilder()..update(updates)).build();

  _$GUpdateTransaction._(
      {this.description,
      this.sender,
      this.senderLocal,
      this.receiver,
      this.receiverLocal,
      this.moneyNode})
      : super._();

  @override
  GUpdateTransaction rebuild(
          void Function(GUpdateTransactionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUpdateTransactionBuilder toBuilder() =>
      new GUpdateTransactionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUpdateTransaction &&
        description == other.description &&
        sender == other.sender &&
        senderLocal == other.senderLocal &&
        receiver == other.receiver &&
        receiverLocal == other.receiverLocal &&
        moneyNode == other.moneyNode;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, description.hashCode), sender.hashCode),
                    senderLocal.hashCode),
                receiver.hashCode),
            receiverLocal.hashCode),
        moneyNode.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GUpdateTransaction')
          ..add('description', description)
          ..add('sender', sender)
          ..add('senderLocal', senderLocal)
          ..add('receiver', receiver)
          ..add('receiverLocal', receiverLocal)
          ..add('moneyNode', moneyNode))
        .toString();
  }
}

class GUpdateTransactionBuilder
    implements Builder<GUpdateTransaction, GUpdateTransactionBuilder> {
  _$GUpdateTransaction _$v;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  int _sender;
  int get sender => _$this._sender;
  set sender(int sender) => _$this._sender = sender;

  bool _senderLocal;
  bool get senderLocal => _$this._senderLocal;
  set senderLocal(bool senderLocal) => _$this._senderLocal = senderLocal;

  int _receiver;
  int get receiver => _$this._receiver;
  set receiver(int receiver) => _$this._receiver = receiver;

  bool _receiverLocal;
  bool get receiverLocal => _$this._receiverLocal;
  set receiverLocal(bool receiverLocal) =>
      _$this._receiverLocal = receiverLocal;

  int _moneyNode;
  int get moneyNode => _$this._moneyNode;
  set moneyNode(int moneyNode) => _$this._moneyNode = moneyNode;

  GUpdateTransactionBuilder();

  GUpdateTransactionBuilder get _$this {
    if (_$v != null) {
      _description = _$v.description;
      _sender = _$v.sender;
      _senderLocal = _$v.senderLocal;
      _receiver = _$v.receiver;
      _receiverLocal = _$v.receiverLocal;
      _moneyNode = _$v.moneyNode;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUpdateTransaction other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GUpdateTransaction;
  }

  @override
  void update(void Function(GUpdateTransactionBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GUpdateTransaction build() {
    final _$result = _$v ??
        new _$GUpdateTransaction._(
            description: description,
            sender: sender,
            senderLocal: senderLocal,
            receiver: receiver,
            receiverLocal: receiverLocal,
            moneyNode: moneyNode);
    replace(_$result);
    return _$result;
  }
}

class _$GUpdateTransactionEntity extends GUpdateTransactionEntity {
  @override
  final String description;
  @override
  final int organisation;
  @override
  final int person;
  @override
  final String iban;
  @override
  final String bic;

  factory _$GUpdateTransactionEntity(
          [void Function(GUpdateTransactionEntityBuilder) updates]) =>
      (new GUpdateTransactionEntityBuilder()..update(updates)).build();

  _$GUpdateTransactionEntity._(
      {this.description, this.organisation, this.person, this.iban, this.bic})
      : super._();

  @override
  GUpdateTransactionEntity rebuild(
          void Function(GUpdateTransactionEntityBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUpdateTransactionEntityBuilder toBuilder() =>
      new GUpdateTransactionEntityBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUpdateTransactionEntity &&
        description == other.description &&
        organisation == other.organisation &&
        person == other.person &&
        iban == other.iban &&
        bic == other.bic;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, description.hashCode), organisation.hashCode),
                person.hashCode),
            iban.hashCode),
        bic.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GUpdateTransactionEntity')
          ..add('description', description)
          ..add('organisation', organisation)
          ..add('person', person)
          ..add('iban', iban)
          ..add('bic', bic))
        .toString();
  }
}

class GUpdateTransactionEntityBuilder
    implements
        Builder<GUpdateTransactionEntity, GUpdateTransactionEntityBuilder> {
  _$GUpdateTransactionEntity _$v;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  int _organisation;
  int get organisation => _$this._organisation;
  set organisation(int organisation) => _$this._organisation = organisation;

  int _person;
  int get person => _$this._person;
  set person(int person) => _$this._person = person;

  String _iban;
  String get iban => _$this._iban;
  set iban(String iban) => _$this._iban = iban;

  String _bic;
  String get bic => _$this._bic;
  set bic(String bic) => _$this._bic = bic;

  GUpdateTransactionEntityBuilder();

  GUpdateTransactionEntityBuilder get _$this {
    if (_$v != null) {
      _description = _$v.description;
      _organisation = _$v.organisation;
      _person = _$v.person;
      _iban = _$v.iban;
      _bic = _$v.bic;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUpdateTransactionEntity other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GUpdateTransactionEntity;
  }

  @override
  void update(void Function(GUpdateTransactionEntityBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GUpdateTransactionEntity build() {
    final _$result = _$v ??
        new _$GUpdateTransactionEntity._(
            description: description,
            organisation: organisation,
            person: person,
            iban: iban,
            bic: bic);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
