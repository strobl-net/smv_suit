// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:gql/ast.dart' as _i1;

const Bill = _i1.ObjectTypeDefinitionNode(
    name: _i1.NameNode(value: 'Bill'),
    directives: [],
    interfaces: [],
    fields: [
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'id'),
          directives: [],
          args: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'Int'), isNonNull: true)),
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'received'),
          directives: [],
          args: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'NaiveDateTime'), isNonNull: true)),
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'processed'),
          directives: [],
          args: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'NaiveDateTime'), isNonNull: false)),
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'products'),
          directives: [],
          args: [],
          type: _i1.ListTypeNode(
              type: _i1.NamedTypeNode(
                  name: _i1.NameNode(value: 'Int'), isNonNull: true),
              isNonNull: false)),
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'responsible'),
          directives: [],
          args: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'Int'), isNonNull: false)),
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'transaction'),
          directives: [],
          args: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'Int'), isNonNull: true)),
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'added'),
          directives: [],
          args: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'NaiveDateTime'), isNonNull: true)),
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'changed'),
          directives: [],
          args: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'NaiveDateTime'), isNonNull: false))
    ]);
const Branch = _i1.EnumTypeDefinitionNode(
    name: _i1.NameNode(value: 'Branch'),
    directives: [],
    values: [
      _i1.EnumValueDefinitionNode(
          name: _i1.NameNode(value: 'DIGITAL'), directives: []),
      _i1.EnumValueDefinitionNode(
          name: _i1.NameNode(value: 'CASH'), directives: [])
    ]);
const Currency = _i1.EnumTypeDefinitionNode(
    name: _i1.NameNode(value: 'Currency'),
    directives: [],
    values: [
      _i1.EnumValueDefinitionNode(
          name: _i1.NameNode(value: 'EUR'), directives: []),
      _i1.EnumValueDefinitionNode(
          name: _i1.NameNode(value: 'USD'), directives: [])
    ]);
const Depodraw = _i1.ObjectTypeDefinitionNode(
    name: _i1.NameNode(value: 'Depodraw'),
    directives: [],
    interfaces: [],
    fields: [
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'id'),
          directives: [],
          args: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'Int'), isNonNull: true)),
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'description'),
          directives: [],
          args: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'String'), isNonNull: false)),
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'transactionUp'),
          directives: [],
          args: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'Int'), isNonNull: true)),
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'transactionDown'),
          directives: [],
          args: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'Int'), isNonNull: true)),
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'added'),
          directives: [],
          args: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'NaiveDateTime'), isNonNull: true)),
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'changed'),
          directives: [],
          args: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'NaiveDateTime'), isNonNull: false))
    ]);
const InputBill = _i1.InputObjectTypeDefinitionNode(
    name: _i1.NameNode(value: 'InputBill'),
    directives: [],
    fields: [
      _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'received'),
          directives: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'NaiveDateTime'), isNonNull: true),
          defaultValue: null),
      _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'processed'),
          directives: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'NaiveDateTime'), isNonNull: false),
          defaultValue: null),
      _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'products'),
          directives: [],
          type: _i1.ListTypeNode(
              type: _i1.NamedTypeNode(
                  name: _i1.NameNode(value: 'Int'), isNonNull: true),
              isNonNull: false),
          defaultValue: null),
      _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'responsible'),
          directives: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'Int'), isNonNull: false),
          defaultValue: null),
      _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'transaction'),
          directives: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'Int'), isNonNull: true),
          defaultValue: null)
    ]);
const InputDepodraw = _i1.InputObjectTypeDefinitionNode(
    name: _i1.NameNode(value: 'InputDepodraw'),
    directives: [],
    fields: [
      _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'description'),
          directives: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'String'), isNonNull: false),
          defaultValue: null),
      _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'transactionUp'),
          directives: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'Int'), isNonNull: true),
          defaultValue: null),
      _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'transactionDown'),
          directives: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'Int'), isNonNull: true),
          defaultValue: null)
    ]);
const InputMoneyNode = _i1.InputObjectTypeDefinitionNode(
    name: _i1.NameNode(value: 'InputMoneyNode'),
    directives: [],
    fields: [
      _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'branch'),
          directives: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'Branch'), isNonNull: true),
          defaultValue: null),
      _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'change'),
          directives: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'Int'), isNonNull: true),
          defaultValue: null),
      _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'currency'),
          directives: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'Currency'), isNonNull: true),
          defaultValue: null),
      _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'processed'),
          directives: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'Boolean'), isNonNull: true),
          defaultValue: null)
    ]);
const InputOrganisation = _i1.InputObjectTypeDefinitionNode(
    name: _i1.NameNode(value: 'InputOrganisation'),
    directives: [],
    fields: [
      _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'name'),
          directives: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'String'), isNonNull: true),
          defaultValue: null),
      _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'description'),
          directives: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'String'), isNonNull: false),
          defaultValue: null),
      _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'site'),
          directives: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'String'), isNonNull: false),
          defaultValue: null),
      _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'location'),
          directives: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'String'), isNonNull: false),
          defaultValue: null)
    ]);
const InputPerson = _i1.InputObjectTypeDefinitionNode(
    name: _i1.NameNode(value: 'InputPerson'),
    directives: [],
    fields: [
      _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'name'),
          directives: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'String'), isNonNull: true),
          defaultValue: null),
      _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'email'),
          directives: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'String'), isNonNull: false),
          defaultValue: null),
      _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'phone'),
          directives: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'String'), isNonNull: false),
          defaultValue: null),
      _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'tags'),
          directives: [],
          type: _i1.ListTypeNode(
              type: _i1.NamedTypeNode(
                  name: _i1.NameNode(value: 'String'), isNonNull: true),
              isNonNull: true),
          defaultValue: null)
    ]);
const InputProduct = _i1.InputObjectTypeDefinitionNode(
    name: _i1.NameNode(value: 'InputProduct'),
    directives: [],
    fields: [
      _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'name'),
          directives: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'String'), isNonNull: true),
          defaultValue: null),
      _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'description'),
          directives: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'String'), isNonNull: false),
          defaultValue: null),
      _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'change'),
          directives: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'Int'), isNonNull: false),
          defaultValue: null),
      _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'currency'),
          directives: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'Currency'), isNonNull: false),
          defaultValue: null),
      _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'provider'),
          directives: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'Int'), isNonNull: false),
          defaultValue: null),
      _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'tags'),
          directives: [],
          type: _i1.ListTypeNode(
              type: _i1.NamedTypeNode(
                  name: _i1.NameNode(value: 'String'), isNonNull: true),
              isNonNull: false),
          defaultValue: null)
    ]);
const InputStatementOfAccount = _i1.InputObjectTypeDefinitionNode(
    name: _i1.NameNode(value: 'InputStatementOfAccount'),
    directives: [],
    fields: [
      _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'description'),
          directives: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'String'), isNonNull: false),
          defaultValue: null),
      _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'starting'),
          directives: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'NaiveDateTime'), isNonNull: true),
          defaultValue: null),
      _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'ending'),
          directives: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'NaiveDateTime'), isNonNull: true),
          defaultValue: null)
    ]);
const InputTransaction = _i1.InputObjectTypeDefinitionNode(
    name: _i1.NameNode(value: 'InputTransaction'),
    directives: [],
    fields: [
      _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'description'),
          directives: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'String'), isNonNull: false),
          defaultValue: null),
      _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'sender'),
          directives: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'Int'), isNonNull: true),
          defaultValue: null),
      _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'senderLocal'),
          directives: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'Boolean'), isNonNull: true),
          defaultValue: null),
      _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'receiver'),
          directives: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'Int'), isNonNull: true),
          defaultValue: null),
      _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'receiverLocal'),
          directives: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'Boolean'), isNonNull: true),
          defaultValue: null),
      _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'moneyNode'),
          directives: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'Int'), isNonNull: true),
          defaultValue: null)
    ]);
const InputTransactionEntity = _i1.InputObjectTypeDefinitionNode(
    name: _i1.NameNode(value: 'InputTransactionEntity'),
    directives: [],
    fields: [
      _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'description'),
          directives: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'String'), isNonNull: false),
          defaultValue: null),
      _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'organisation'),
          directives: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'Int'), isNonNull: false),
          defaultValue: null),
      _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'person'),
          directives: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'Int'), isNonNull: false),
          defaultValue: null),
      _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'iban'),
          directives: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'String'), isNonNull: false),
          defaultValue: null),
      _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'bic'),
          directives: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'String'), isNonNull: false),
          defaultValue: null)
    ]);
const MoneyNode = _i1.ObjectTypeDefinitionNode(
    name: _i1.NameNode(value: 'MoneyNode'),
    directives: [],
    interfaces: [],
    fields: [
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'id'),
          directives: [],
          args: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'Int'), isNonNull: true)),
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'branch'),
          directives: [],
          args: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'Branch'), isNonNull: true)),
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'change'),
          directives: [],
          args: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'Int'), isNonNull: true)),
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'currency'),
          directives: [],
          args: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'Currency'), isNonNull: true)),
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'processed'),
          directives: [],
          args: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'Boolean'), isNonNull: true)),
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'added'),
          directives: [],
          args: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'NaiveDateTime'), isNonNull: true)),
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'changed'),
          directives: [],
          args: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'NaiveDateTime'), isNonNull: false))
    ]);
const Mutation = _i1.ObjectTypeDefinitionNode(
    name: _i1.NameNode(value: 'Mutation'),
    directives: [],
    interfaces: [],
    fields: [
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'billNew'),
          directives: [],
          args: [
            _i1.InputValueDefinitionNode(
                name: _i1.NameNode(value: 'bill'),
                directives: [],
                type: _i1.NamedTypeNode(
                    name: _i1.NameNode(value: 'InputBill'), isNonNull: true),
                defaultValue: null)
          ],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'Bill'), isNonNull: true)),
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'billUpdate'),
          directives: [],
          args: [
            _i1.InputValueDefinitionNode(
                name: _i1.NameNode(value: 'bill'),
                directives: [],
                type: _i1.NamedTypeNode(
                    name: _i1.NameNode(value: 'UpdateBill'), isNonNull: true),
                defaultValue: null),
            _i1.InputValueDefinitionNode(
                name: _i1.NameNode(value: 'id'),
                directives: [],
                type: _i1.NamedTypeNode(
                    name: _i1.NameNode(value: 'Int'), isNonNull: true),
                defaultValue: null)
          ],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'Bill'), isNonNull: true)),
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'billDelete'),
          directives: [],
          args: [
            _i1.InputValueDefinitionNode(
                name: _i1.NameNode(value: 'id'),
                directives: [],
                type: _i1.NamedTypeNode(
                    name: _i1.NameNode(value: 'Int'), isNonNull: true),
                defaultValue: null)
          ],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'Bill'), isNonNull: true)),
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'depodrawNew'),
          directives: [],
          args: [
            _i1.InputValueDefinitionNode(
                name: _i1.NameNode(value: 'depodraw'),
                directives: [],
                type: _i1.NamedTypeNode(
                    name: _i1.NameNode(value: 'InputDepodraw'),
                    isNonNull: true),
                defaultValue: null)
          ],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'Depodraw'), isNonNull: true)),
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'depodrawUpdate'),
          directives: [],
          args: [
            _i1.InputValueDefinitionNode(
                name: _i1.NameNode(value: 'depodraw'),
                directives: [],
                type: _i1.NamedTypeNode(
                    name: _i1.NameNode(value: 'UpdateDepodraw'),
                    isNonNull: true),
                defaultValue: null),
            _i1.InputValueDefinitionNode(
                name: _i1.NameNode(value: 'id'),
                directives: [],
                type: _i1.NamedTypeNode(
                    name: _i1.NameNode(value: 'Int'), isNonNull: true),
                defaultValue: null)
          ],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'Depodraw'), isNonNull: true)),
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'depodrawDelete'),
          directives: [],
          args: [
            _i1.InputValueDefinitionNode(
                name: _i1.NameNode(value: 'id'),
                directives: [],
                type: _i1.NamedTypeNode(
                    name: _i1.NameNode(value: 'Int'), isNonNull: true),
                defaultValue: null)
          ],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'Depodraw'), isNonNull: true)),
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'moneyNodeNew'),
          directives: [],
          args: [
            _i1.InputValueDefinitionNode(
                name: _i1.NameNode(value: 'moneyNode'),
                directives: [],
                type: _i1.NamedTypeNode(
                    name: _i1.NameNode(value: 'InputMoneyNode'),
                    isNonNull: true),
                defaultValue: null)
          ],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'MoneyNode'), isNonNull: true)),
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'moneyNodeUpdate'),
          directives: [],
          args: [
            _i1.InputValueDefinitionNode(
                name: _i1.NameNode(value: 'moneyNode'),
                directives: [],
                type: _i1.NamedTypeNode(
                    name: _i1.NameNode(value: 'UpdateMoneyNode'),
                    isNonNull: true),
                defaultValue: null),
            _i1.InputValueDefinitionNode(
                name: _i1.NameNode(value: 'id'),
                directives: [],
                type: _i1.NamedTypeNode(
                    name: _i1.NameNode(value: 'Int'), isNonNull: true),
                defaultValue: null)
          ],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'MoneyNode'), isNonNull: true)),
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'moneyNodeDelete'),
          directives: [],
          args: [
            _i1.InputValueDefinitionNode(
                name: _i1.NameNode(value: 'id'),
                directives: [],
                type: _i1.NamedTypeNode(
                    name: _i1.NameNode(value: 'Int'), isNonNull: true),
                defaultValue: null)
          ],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'MoneyNode'), isNonNull: true)),
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'organisationNew'),
          directives: [],
          args: [
            _i1.InputValueDefinitionNode(
                name: _i1.NameNode(value: 'organisation'),
                directives: [],
                type: _i1.NamedTypeNode(
                    name: _i1.NameNode(value: 'InputOrganisation'),
                    isNonNull: true),
                defaultValue: null)
          ],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'Organisation'), isNonNull: true)),
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'organisationUpdate'),
          directives: [],
          args: [
            _i1.InputValueDefinitionNode(
                name: _i1.NameNode(value: 'organisation'),
                directives: [],
                type: _i1.NamedTypeNode(
                    name: _i1.NameNode(value: 'UpdateOrganisation'),
                    isNonNull: true),
                defaultValue: null),
            _i1.InputValueDefinitionNode(
                name: _i1.NameNode(value: 'id'),
                directives: [],
                type: _i1.NamedTypeNode(
                    name: _i1.NameNode(value: 'Int'), isNonNull: true),
                defaultValue: null)
          ],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'Organisation'), isNonNull: true)),
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'organisationDelete'),
          directives: [],
          args: [
            _i1.InputValueDefinitionNode(
                name: _i1.NameNode(value: 'id'),
                directives: [],
                type: _i1.NamedTypeNode(
                    name: _i1.NameNode(value: 'Int'), isNonNull: true),
                defaultValue: null)
          ],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'Organisation'), isNonNull: true)),
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'personNew'),
          directives: [],
          args: [
            _i1.InputValueDefinitionNode(
                name: _i1.NameNode(value: 'person'),
                directives: [],
                type: _i1.NamedTypeNode(
                    name: _i1.NameNode(value: 'InputPerson'), isNonNull: true),
                defaultValue: null)
          ],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'Person'), isNonNull: true)),
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'personUpdate'),
          directives: [],
          args: [
            _i1.InputValueDefinitionNode(
                name: _i1.NameNode(value: 'person'),
                directives: [],
                type: _i1.NamedTypeNode(
                    name: _i1.NameNode(value: 'UpdatePerson'), isNonNull: true),
                defaultValue: null),
            _i1.InputValueDefinitionNode(
                name: _i1.NameNode(value: 'id'),
                directives: [],
                type: _i1.NamedTypeNode(
                    name: _i1.NameNode(value: 'Int'), isNonNull: true),
                defaultValue: null)
          ],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'Person'), isNonNull: true)),
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'personDelete'),
          directives: [],
          args: [
            _i1.InputValueDefinitionNode(
                name: _i1.NameNode(value: 'id'),
                directives: [],
                type: _i1.NamedTypeNode(
                    name: _i1.NameNode(value: 'Int'), isNonNull: true),
                defaultValue: null)
          ],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'Person'), isNonNull: true)),
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'productNew'),
          directives: [],
          args: [
            _i1.InputValueDefinitionNode(
                name: _i1.NameNode(value: 'product'),
                directives: [],
                type: _i1.NamedTypeNode(
                    name: _i1.NameNode(value: 'InputProduct'), isNonNull: true),
                defaultValue: null)
          ],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'Product'), isNonNull: true)),
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'productUpdate'),
          directives: [],
          args: [
            _i1.InputValueDefinitionNode(
                name: _i1.NameNode(value: 'product'),
                directives: [],
                type: _i1.NamedTypeNode(
                    name: _i1.NameNode(value: 'UpdateProduct'),
                    isNonNull: true),
                defaultValue: null),
            _i1.InputValueDefinitionNode(
                name: _i1.NameNode(value: 'id'),
                directives: [],
                type: _i1.NamedTypeNode(
                    name: _i1.NameNode(value: 'Int'), isNonNull: true),
                defaultValue: null)
          ],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'Product'), isNonNull: true)),
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'productDelete'),
          directives: [],
          args: [
            _i1.InputValueDefinitionNode(
                name: _i1.NameNode(value: 'id'),
                directives: [],
                type: _i1.NamedTypeNode(
                    name: _i1.NameNode(value: 'Int'), isNonNull: true),
                defaultValue: null)
          ],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'Product'), isNonNull: true)),
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'statementOfAccountNew'),
          directives: [],
          args: [
            _i1.InputValueDefinitionNode(
                name: _i1.NameNode(value: 'statementOfAccount'),
                directives: [],
                type: _i1.NamedTypeNode(
                    name: _i1.NameNode(value: 'InputStatementOfAccount'),
                    isNonNull: true),
                defaultValue: null)
          ],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'StatementOfAccount'),
              isNonNull: true)),
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'statementOfAccountUpdate'),
          directives: [],
          args: [
            _i1.InputValueDefinitionNode(
                name: _i1.NameNode(value: 'statementOfAccount'),
                directives: [],
                type: _i1.NamedTypeNode(
                    name: _i1.NameNode(value: 'UpdateStatementOfAccount'),
                    isNonNull: true),
                defaultValue: null),
            _i1.InputValueDefinitionNode(
                name: _i1.NameNode(value: 'id'),
                directives: [],
                type: _i1.NamedTypeNode(
                    name: _i1.NameNode(value: 'Int'), isNonNull: true),
                defaultValue: null)
          ],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'StatementOfAccount'),
              isNonNull: true)),
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'statementOfAccountDelete'),
          directives: [],
          args: [
            _i1.InputValueDefinitionNode(
                name: _i1.NameNode(value: 'id'),
                directives: [],
                type: _i1.NamedTypeNode(
                    name: _i1.NameNode(value: 'Int'), isNonNull: true),
                defaultValue: null)
          ],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'StatementOfAccount'),
              isNonNull: true)),
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'transactionNew'),
          directives: [],
          args: [
            _i1.InputValueDefinitionNode(
                name: _i1.NameNode(value: 'transaction'),
                directives: [],
                type: _i1.NamedTypeNode(
                    name: _i1.NameNode(value: 'InputTransaction'),
                    isNonNull: true),
                defaultValue: null)
          ],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'Transaction'), isNonNull: true)),
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'transactionUpdate'),
          directives: [],
          args: [
            _i1.InputValueDefinitionNode(
                name: _i1.NameNode(value: 'transaction'),
                directives: [],
                type: _i1.NamedTypeNode(
                    name: _i1.NameNode(value: 'UpdateTransaction'),
                    isNonNull: true),
                defaultValue: null),
            _i1.InputValueDefinitionNode(
                name: _i1.NameNode(value: 'id'),
                directives: [],
                type: _i1.NamedTypeNode(
                    name: _i1.NameNode(value: 'Int'), isNonNull: true),
                defaultValue: null)
          ],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'Transaction'), isNonNull: true)),
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'transactionDelete'),
          directives: [],
          args: [
            _i1.InputValueDefinitionNode(
                name: _i1.NameNode(value: 'id'),
                directives: [],
                type: _i1.NamedTypeNode(
                    name: _i1.NameNode(value: 'Int'), isNonNull: true),
                defaultValue: null)
          ],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'Transaction'), isNonNull: true)),
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'transactionEntityNew'),
          directives: [],
          args: [
            _i1.InputValueDefinitionNode(
                name: _i1.NameNode(value: 'transactionEntity'),
                directives: [],
                type: _i1.NamedTypeNode(
                    name: _i1.NameNode(value: 'InputTransactionEntity'),
                    isNonNull: true),
                defaultValue: null)
          ],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'TransactionEntity'), isNonNull: true)),
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'transactionEntityUpdate'),
          directives: [],
          args: [
            _i1.InputValueDefinitionNode(
                name: _i1.NameNode(value: 'transactionEntity'),
                directives: [],
                type: _i1.NamedTypeNode(
                    name: _i1.NameNode(value: 'UpdateTransactionEntity'),
                    isNonNull: true),
                defaultValue: null),
            _i1.InputValueDefinitionNode(
                name: _i1.NameNode(value: 'id'),
                directives: [],
                type: _i1.NamedTypeNode(
                    name: _i1.NameNode(value: 'Int'), isNonNull: true),
                defaultValue: null)
          ],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'TransactionEntity'), isNonNull: true)),
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'transactionEntityDelete'),
          directives: [],
          args: [
            _i1.InputValueDefinitionNode(
                name: _i1.NameNode(value: 'id'),
                directives: [],
                type: _i1.NamedTypeNode(
                    name: _i1.NameNode(value: 'Int'), isNonNull: true),
                defaultValue: null)
          ],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'TransactionEntity'), isNonNull: true))
    ]);
const NaiveDateTime = _i1.ScalarTypeDefinitionNode(
    name: _i1.NameNode(value: 'NaiveDateTime'), directives: []);
const Organisation = _i1.ObjectTypeDefinitionNode(
    name: _i1.NameNode(value: 'Organisation'),
    directives: [],
    interfaces: [],
    fields: [
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'id'),
          directives: [],
          args: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'Int'), isNonNull: true)),
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'name'),
          directives: [],
          args: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'String'), isNonNull: true)),
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'description'),
          directives: [],
          args: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'String'), isNonNull: false)),
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'site'),
          directives: [],
          args: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'String'), isNonNull: false)),
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'location'),
          directives: [],
          args: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'String'), isNonNull: false)),
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'added'),
          directives: [],
          args: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'NaiveDateTime'), isNonNull: true)),
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'changed'),
          directives: [],
          args: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'NaiveDateTime'), isNonNull: false))
    ]);
const Person = _i1.ObjectTypeDefinitionNode(
    name: _i1.NameNode(value: 'Person'),
    directives: [],
    interfaces: [],
    fields: [
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'id'),
          directives: [],
          args: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'Int'), isNonNull: true)),
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'name'),
          directives: [],
          args: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'String'), isNonNull: true)),
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'email'),
          directives: [],
          args: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'String'), isNonNull: false)),
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'phone'),
          directives: [],
          args: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'String'), isNonNull: false)),
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'tags'),
          directives: [],
          args: [],
          type: _i1.ListTypeNode(
              type: _i1.NamedTypeNode(
                  name: _i1.NameNode(value: 'String'), isNonNull: true),
              isNonNull: true)),
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'added'),
          directives: [],
          args: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'NaiveDateTime'), isNonNull: true)),
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'changed'),
          directives: [],
          args: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'NaiveDateTime'), isNonNull: false))
    ]);
const Product = _i1.ObjectTypeDefinitionNode(
    name: _i1.NameNode(value: 'Product'),
    directives: [],
    interfaces: [],
    fields: [
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'id'),
          directives: [],
          args: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'Int'), isNonNull: true)),
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'name'),
          directives: [],
          args: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'String'), isNonNull: true)),
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'description'),
          directives: [],
          args: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'String'), isNonNull: false)),
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'change'),
          directives: [],
          args: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'Int'), isNonNull: false)),
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'currency'),
          directives: [],
          args: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'Currency'), isNonNull: false)),
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'provider'),
          directives: [],
          args: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'Int'), isNonNull: false)),
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'tags'),
          directives: [],
          args: [],
          type: _i1.ListTypeNode(
              type: _i1.NamedTypeNode(
                  name: _i1.NameNode(value: 'String'), isNonNull: true),
              isNonNull: false)),
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'added'),
          directives: [],
          args: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'NaiveDateTime'), isNonNull: true)),
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'changed'),
          directives: [],
          args: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'NaiveDateTime'), isNonNull: false))
    ]);
const Query = _i1.ObjectTypeDefinitionNode(
    name: _i1.NameNode(value: 'Query'),
    directives: [],
    interfaces: [],
    fields: [
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'bills'),
          directives: [],
          args: [],
          type: _i1.ListTypeNode(
              type: _i1.NamedTypeNode(
                  name: _i1.NameNode(value: 'Bill'), isNonNull: true),
              isNonNull: true)),
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'billById'),
          directives: [],
          args: [
            _i1.InputValueDefinitionNode(
                name: _i1.NameNode(value: 'id'),
                directives: [],
                type: _i1.NamedTypeNode(
                    name: _i1.NameNode(value: 'Int'), isNonNull: true),
                defaultValue: null)
          ],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'Bill'), isNonNull: false)),
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'depodraws'),
          directives: [],
          args: [],
          type: _i1.ListTypeNode(
              type: _i1.NamedTypeNode(
                  name: _i1.NameNode(value: 'Depodraw'), isNonNull: true),
              isNonNull: true)),
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'depodrawsById'),
          directives: [],
          args: [
            _i1.InputValueDefinitionNode(
                name: _i1.NameNode(value: 'id'),
                directives: [],
                type: _i1.NamedTypeNode(
                    name: _i1.NameNode(value: 'Int'), isNonNull: true),
                defaultValue: null)
          ],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'Depodraw'), isNonNull: false)),
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'moneyNodes'),
          directives: [],
          args: [],
          type: _i1.ListTypeNode(
              type: _i1.NamedTypeNode(
                  name: _i1.NameNode(value: 'MoneyNode'), isNonNull: true),
              isNonNull: true)),
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'moneyNodesById'),
          directives: [],
          args: [
            _i1.InputValueDefinitionNode(
                name: _i1.NameNode(value: 'id'),
                directives: [],
                type: _i1.NamedTypeNode(
                    name: _i1.NameNode(value: 'Int'), isNonNull: true),
                defaultValue: null)
          ],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'MoneyNode'), isNonNull: false)),
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'organisations'),
          directives: [],
          args: [],
          type: _i1.ListTypeNode(
              type: _i1.NamedTypeNode(
                  name: _i1.NameNode(value: 'Organisation'), isNonNull: true),
              isNonNull: true)),
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'organisationsById'),
          directives: [],
          args: [
            _i1.InputValueDefinitionNode(
                name: _i1.NameNode(value: 'id'),
                directives: [],
                type: _i1.NamedTypeNode(
                    name: _i1.NameNode(value: 'Int'), isNonNull: true),
                defaultValue: null)
          ],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'Organisation'), isNonNull: false)),
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'persons'),
          directives: [],
          args: [],
          type: _i1.ListTypeNode(
              type: _i1.NamedTypeNode(
                  name: _i1.NameNode(value: 'Person'), isNonNull: true),
              isNonNull: true)),
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'personById'),
          directives: [],
          args: [
            _i1.InputValueDefinitionNode(
                name: _i1.NameNode(value: 'id'),
                directives: [],
                type: _i1.NamedTypeNode(
                    name: _i1.NameNode(value: 'Int'), isNonNull: true),
                defaultValue: null)
          ],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'Person'), isNonNull: false)),
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'products'),
          directives: [],
          args: [],
          type: _i1.ListTypeNode(
              type: _i1.NamedTypeNode(
                  name: _i1.NameNode(value: 'Product'), isNonNull: true),
              isNonNull: true)),
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'productsById'),
          directives: [],
          args: [
            _i1.InputValueDefinitionNode(
                name: _i1.NameNode(value: 'id'),
                directives: [],
                type: _i1.NamedTypeNode(
                    name: _i1.NameNode(value: 'Int'), isNonNull: true),
                defaultValue: null)
          ],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'Product'), isNonNull: false)),
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'statementOfAccounts'),
          directives: [],
          args: [],
          type: _i1.ListTypeNode(
              type: _i1.NamedTypeNode(
                  name: _i1.NameNode(value: 'StatementOfAccount'),
                  isNonNull: true),
              isNonNull: true)),
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'statementOfAccountsById'),
          directives: [],
          args: [
            _i1.InputValueDefinitionNode(
                name: _i1.NameNode(value: 'id'),
                directives: [],
                type: _i1.NamedTypeNode(
                    name: _i1.NameNode(value: 'Int'), isNonNull: true),
                defaultValue: null)
          ],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'StatementOfAccount'),
              isNonNull: false)),
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'transactions'),
          directives: [],
          args: [],
          type: _i1.ListTypeNode(
              type: _i1.NamedTypeNode(
                  name: _i1.NameNode(value: 'Transaction'), isNonNull: true),
              isNonNull: true)),
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'transactionsById'),
          directives: [],
          args: [
            _i1.InputValueDefinitionNode(
                name: _i1.NameNode(value: 'id'),
                directives: [],
                type: _i1.NamedTypeNode(
                    name: _i1.NameNode(value: 'Int'), isNonNull: true),
                defaultValue: null)
          ],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'Transaction'), isNonNull: false)),
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'transactionsEntities'),
          directives: [],
          args: [],
          type: _i1.ListTypeNode(
              type: _i1.NamedTypeNode(
                  name: _i1.NameNode(value: 'TransactionEntity'),
                  isNonNull: true),
              isNonNull: true)),
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'transactionEntitiesById'),
          directives: [],
          args: [
            _i1.InputValueDefinitionNode(
                name: _i1.NameNode(value: 'id'),
                directives: [],
                type: _i1.NamedTypeNode(
                    name: _i1.NameNode(value: 'Int'), isNonNull: true),
                defaultValue: null)
          ],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'TransactionEntity'), isNonNull: false))
    ]);
const StatementOfAccount = _i1.ObjectTypeDefinitionNode(
    name: _i1.NameNode(value: 'StatementOfAccount'),
    directives: [],
    interfaces: [],
    fields: [
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'id'),
          directives: [],
          args: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'Int'), isNonNull: true)),
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'description'),
          directives: [],
          args: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'String'), isNonNull: false)),
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'starting'),
          directives: [],
          args: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'NaiveDateTime'), isNonNull: true)),
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'ending'),
          directives: [],
          args: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'NaiveDateTime'), isNonNull: true)),
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'added'),
          directives: [],
          args: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'NaiveDateTime'), isNonNull: true)),
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'changed'),
          directives: [],
          args: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'NaiveDateTime'), isNonNull: false))
    ]);
const Transaction = _i1.ObjectTypeDefinitionNode(
    name: _i1.NameNode(value: 'Transaction'),
    directives: [],
    interfaces: [],
    fields: [
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'id'),
          directives: [],
          args: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'Int'), isNonNull: true)),
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'description'),
          directives: [],
          args: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'String'), isNonNull: false)),
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'sender'),
          directives: [],
          args: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'Int'), isNonNull: true)),
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'senderLocal'),
          directives: [],
          args: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'Boolean'), isNonNull: true)),
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'receiver'),
          directives: [],
          args: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'Int'), isNonNull: true)),
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'receiverLocal'),
          directives: [],
          args: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'Boolean'), isNonNull: true)),
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'moneyNode'),
          directives: [],
          args: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'Int'), isNonNull: true)),
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'added'),
          directives: [],
          args: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'NaiveDateTime'), isNonNull: true)),
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'changed'),
          directives: [],
          args: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'NaiveDateTime'), isNonNull: false))
    ]);
const TransactionEntity = _i1.ObjectTypeDefinitionNode(
    name: _i1.NameNode(value: 'TransactionEntity'),
    directives: [],
    interfaces: [],
    fields: [
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'id'),
          directives: [],
          args: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'Int'), isNonNull: true)),
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'description'),
          directives: [],
          args: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'String'), isNonNull: false)),
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'organisation'),
          directives: [],
          args: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'Int'), isNonNull: false)),
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'person'),
          directives: [],
          args: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'Int'), isNonNull: false)),
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'iban'),
          directives: [],
          args: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'String'), isNonNull: false)),
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'bic'),
          directives: [],
          args: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'String'), isNonNull: false)),
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'added'),
          directives: [],
          args: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'NaiveDateTime'), isNonNull: true)),
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'changed'),
          directives: [],
          args: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'NaiveDateTime'), isNonNull: false))
    ]);
const UpdateBill = _i1.InputObjectTypeDefinitionNode(
    name: _i1.NameNode(value: 'UpdateBill'),
    directives: [],
    fields: [
      _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'received'),
          directives: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'NaiveDateTime'), isNonNull: false),
          defaultValue: null),
      _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'processed'),
          directives: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'NaiveDateTime'), isNonNull: false),
          defaultValue: null),
      _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'products'),
          directives: [],
          type: _i1.ListTypeNode(
              type: _i1.NamedTypeNode(
                  name: _i1.NameNode(value: 'Int'), isNonNull: true),
              isNonNull: false),
          defaultValue: null),
      _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'responsible'),
          directives: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'Int'), isNonNull: false),
          defaultValue: null),
      _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'transaction'),
          directives: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'Int'), isNonNull: false),
          defaultValue: null)
    ]);
const UpdateDepodraw = _i1.InputObjectTypeDefinitionNode(
    name: _i1.NameNode(value: 'UpdateDepodraw'),
    directives: [],
    fields: [
      _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'description'),
          directives: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'String'), isNonNull: false),
          defaultValue: null),
      _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'transactionUp'),
          directives: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'Int'), isNonNull: false),
          defaultValue: null),
      _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'transactionDown'),
          directives: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'Int'), isNonNull: false),
          defaultValue: null)
    ]);
const UpdateMoneyNode = _i1.InputObjectTypeDefinitionNode(
    name: _i1.NameNode(value: 'UpdateMoneyNode'),
    directives: [],
    fields: [
      _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'branch'),
          directives: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'Branch'), isNonNull: false),
          defaultValue: null),
      _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'change'),
          directives: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'Int'), isNonNull: false),
          defaultValue: null),
      _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'currency'),
          directives: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'Currency'), isNonNull: false),
          defaultValue: null),
      _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'processed'),
          directives: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'Boolean'), isNonNull: false),
          defaultValue: null)
    ]);
const UpdateOrganisation = _i1.InputObjectTypeDefinitionNode(
    name: _i1.NameNode(value: 'UpdateOrganisation'),
    directives: [],
    fields: [
      _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'name'),
          directives: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'String'), isNonNull: false),
          defaultValue: null),
      _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'description'),
          directives: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'String'), isNonNull: false),
          defaultValue: null),
      _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'site'),
          directives: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'String'), isNonNull: false),
          defaultValue: null),
      _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'location'),
          directives: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'String'), isNonNull: false),
          defaultValue: null)
    ]);
const UpdatePerson = _i1.InputObjectTypeDefinitionNode(
    name: _i1.NameNode(value: 'UpdatePerson'),
    directives: [],
    fields: [
      _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'name'),
          directives: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'String'), isNonNull: false),
          defaultValue: null),
      _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'email'),
          directives: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'String'), isNonNull: false),
          defaultValue: null),
      _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'phone'),
          directives: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'String'), isNonNull: false),
          defaultValue: null),
      _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'tags'),
          directives: [],
          type: _i1.ListTypeNode(
              type: _i1.NamedTypeNode(
                  name: _i1.NameNode(value: 'String'), isNonNull: true),
              isNonNull: false),
          defaultValue: null)
    ]);
const UpdateProduct = _i1.InputObjectTypeDefinitionNode(
    name: _i1.NameNode(value: 'UpdateProduct'),
    directives: [],
    fields: [
      _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'name'),
          directives: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'String'), isNonNull: false),
          defaultValue: null),
      _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'description'),
          directives: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'String'), isNonNull: false),
          defaultValue: null),
      _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'change'),
          directives: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'Int'), isNonNull: false),
          defaultValue: null),
      _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'currency'),
          directives: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'Currency'), isNonNull: false),
          defaultValue: null),
      _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'provider'),
          directives: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'Int'), isNonNull: false),
          defaultValue: null),
      _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'tags'),
          directives: [],
          type: _i1.ListTypeNode(
              type: _i1.NamedTypeNode(
                  name: _i1.NameNode(value: 'String'), isNonNull: true),
              isNonNull: false),
          defaultValue: null)
    ]);
const UpdateStatementOfAccount = _i1.InputObjectTypeDefinitionNode(
    name: _i1.NameNode(value: 'UpdateStatementOfAccount'),
    directives: [],
    fields: [
      _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'description'),
          directives: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'String'), isNonNull: false),
          defaultValue: null),
      _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'starting'),
          directives: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'NaiveDateTime'), isNonNull: false),
          defaultValue: null),
      _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'ending'),
          directives: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'NaiveDateTime'), isNonNull: false),
          defaultValue: null)
    ]);
const UpdateTransaction = _i1.InputObjectTypeDefinitionNode(
    name: _i1.NameNode(value: 'UpdateTransaction'),
    directives: [],
    fields: [
      _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'description'),
          directives: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'String'), isNonNull: false),
          defaultValue: null),
      _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'sender'),
          directives: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'Int'), isNonNull: false),
          defaultValue: null),
      _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'senderLocal'),
          directives: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'Boolean'), isNonNull: false),
          defaultValue: null),
      _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'receiver'),
          directives: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'Int'), isNonNull: false),
          defaultValue: null),
      _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'receiverLocal'),
          directives: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'Boolean'), isNonNull: false),
          defaultValue: null),
      _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'moneyNode'),
          directives: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'Int'), isNonNull: false),
          defaultValue: null)
    ]);
const UpdateTransactionEntity = _i1.InputObjectTypeDefinitionNode(
    name: _i1.NameNode(value: 'UpdateTransactionEntity'),
    directives: [],
    fields: [
      _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'description'),
          directives: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'String'), isNonNull: false),
          defaultValue: null),
      _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'organisation'),
          directives: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'Int'), isNonNull: false),
          defaultValue: null),
      _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'person'),
          directives: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'Int'), isNonNull: false),
          defaultValue: null),
      _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'iban'),
          directives: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'String'), isNonNull: false),
          defaultValue: null),
      _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'bic'),
          directives: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'String'), isNonNull: false),
          defaultValue: null)
    ]);
const document = _i1.DocumentNode(definitions: [
  Bill,
  Branch,
  Currency,
  Depodraw,
  InputBill,
  InputDepodraw,
  InputMoneyNode,
  InputOrganisation,
  InputPerson,
  InputProduct,
  InputStatementOfAccount,
  InputTransaction,
  InputTransactionEntity,
  MoneyNode,
  Mutation,
  NaiveDateTime,
  Organisation,
  Person,
  Product,
  Query,
  StatementOfAccount,
  Transaction,
  TransactionEntity,
  UpdateBill,
  UpdateDepodraw,
  UpdateMoneyNode,
  UpdateOrganisation,
  UpdatePerson,
  UpdateProduct,
  UpdateStatementOfAccount,
  UpdateTransaction,
  UpdateTransactionEntity
]);
