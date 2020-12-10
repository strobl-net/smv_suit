from datetime import datetime
from typing import Dict, List
from typing import Optional
from aenum import Enum

date_format = "%Y-%m-%dT%H:%M:%S.%f"


Currency = Enum('EUR', 'USD')
Branch = Enum('DIGITAL', 'CASH')


class Person(object):
    id: int
    name: str
    email: Optional[str]
    phone: Optional[str]
    tags = []
    added: datetime
    changed: Optional[datetime]

    def __init__(self, data: Dict):
        tags = str(data['tags'])
        tags = tags.replace('[', '')
        tags = tags.replace(']', '')
        tags = tags.replace('\'', '')
        self.id = data['id']
        self.name = data['name']
        self.email = data['email']
        self.phone = data['phone']
        self.tags = tags
        self.added = datetime.strptime(data['added'], date_format)
        if not data['changed'] is None:
            self.changed = datetime.strptime(data['changed'], date_format)
        else:
            self.changed = None


class Organisation(object):
    id: int
    name = "?XD"
    description: Optional[str]
    site: Optional[str]
    location: Optional[str]
    added: datetime
    changed: Optional[datetime]

    def __init__(self, data: Dict):
        self.id = data['id']
        self.name = data['name']
        self.description = data['description']
        self.site = data['site']
        self.location = data['location']
        self.added = datetime.strptime(data['added'], date_format)
        if not data['changed'] is None:
            self.changed = datetime.strptime(data['changed'], date_format)
        else:
            self.changed = None


class TransactionEntity(object):
    id: int
    description: Optional[str]
    organisation: Optional[int]
    person: Optional[int]
    iban: Optional[str]
    bic: Optional[str]
    added: datetime
    changed: Optional[datetime]

    def __init__(self, data: Dict):
        self.id = data['id']
        self.description = data['description']
        self.organisation = data['organisation']
        self.person = data['person']
        self.iban = data['iban']
        self.bic = data['bic']
        self.added = datetime.strptime(data['added'], date_format)
        if not data['changed'] is None:
            self.changed = datetime.strptime(data['changed'], date_format)
        else:
            self.changed = None


class Product(object):
    id: int
    name: str
    description: Optional[str]
    change: Optional[int]
    currency: Optional[Currency]
    provider: Optional[int]
    tags: []
    added: datetime
    changed: Optional[datetime]

    def __init__(self, data: Dict):
        tags = str(data['tags'])
        tags = tags.replace('[', '')
        tags = tags.replace(']', '')
        tags = tags.replace('\'', '')
        self.id = data['id']
        self.name = data['name']
        self.description = data['description']
        self.change = data['change']
        self.currency = data['currency']
        self.provider = data['provider']
        self.tags = tags
        self.added = datetime.strptime(data['added'], date_format)
        if not data['changed'] is None:
            self.changed = datetime.strptime(data['changed'], date_format)
        else:
            self.changed = None


class MoneyNode:
    id: int
    branch: Branch
    change: int
    currency: Currency
    processed: bool
    added: datetime
    changed: Optional[datetime]

    def __init__(self, data: Dict):
        self.id = data['id']
        self.branch = data['branch']
        self.change = data['change']
        self.currency = data['currency']
        self.processed = data['processed']
        self.added = datetime.strptime(data['added'], date_format)
        if not data['changed'] is None:
            self.changed = datetime.strptime(data['changed'], date_format)
        else:
            self.changed = None


class Transaction:
    id: int
    description: Optional[str]
    sender: int
    sender_local: bool
    receiver: int
    receiver_local: bool
    money_node: int
    added: datetime
    changed: Optional[datetime]

    def __init__(self, data: Dict):
        self.id = data['id']
        self.description = data['description']
        self.sender = data['sender']
        self.sender_local = data['sender_local']
        self.receiver = data['receiver']
        self.receiver_local = data['receiver_local']
        self.money_node = data['money_node']
        self.added = datetime.strptime(data['added'], date_format)
        if not data['changed'] is None:
            self.changed = datetime.strptime(data['changed'], date_format)
        else:
            self.changed = None


class ExpandedTransaction:
    id: int
    description: Optional[str]
    sender: TransactionEntity
    sender_local: bool
    receiver: TransactionEntity
    receiver_local: bool
    money_node: MoneyNode
    added: datetime
    changed: Optional[datetime]

    def __init__(self, data: Dict):
        self.id = data['id']
        self.description = data['description']
        self.sender = TransactionEntity(data=data['sender'])
        self.sender_local = data['sender_local']
        self.receiver = TransactionEntity(data=data['receiver'])
        self.receiver_local = data['receiver_local']
        self.money_node = MoneyNode(data=data['money_node'])
        self.added = datetime.strptime(data['added'], date_format)
        if not data['changed'] is None:
            self.changed = datetime.strptime(data['changed'], date_format)
        else:
            self.changed = None


class UpdateTransaction:
    id: int
    description: Optional[str]
    sender: int
    sender_local: bool
    receiver: int
    receiver_local: bool
    money_node_id: int
    money_branch: Branch
    money_change: int
    money_currency: Currency
    money_processed: bool
    money_added: datetime
    money_changed: Optional[datetime]
    added: datetime
    changed: Optional[datetime]

    def __str__(self):
        return str(self.__class__) + ": " + str(self.__dict__)

    def __init__(self, data: Dict):
        self.id = data['id']
        self.description = data['description']
        self.sender = data['sender']['id']
        self.sender_local = data['sender_local']
        self.receiver = data['receiver']['id']
        self.receiver_local = data['receiver_local']
        self.money_node_id = data['money_node']['id']
        self.money_branch = data['money_node']['branch']
        self.money_change = data['money_node']['change']
        self.money_currency = data['money_node']['currency']
        self.money_processed = data['money_node']['processed']

        self.money_added = datetime.strptime(data['money_node']['added'], date_format)
        if not data['money_node']['changed'] is None:
            self.money_changed = datetime.strptime(data['money_node']['changed'], date_format)
        else:
            self.money_changed = None

        self.added = datetime.strptime(data['added'], date_format)
        if not data['changed'] is None:
            self.changed = datetime.strptime(data['changed'], date_format)
        else:
            self.changed = None


class Bill:
    id: int
    received: datetime
    processed: Optional[datetime]
    products: Optional[List[int]]
    responsible: Optional[int]
    transaction: int
    added: datetime
    changed: Optional[datetime]

    def __init__(self, data: Dict):
        self.id = data['id']
        self.received = data['received']
        self.processed = data['processed']
        self.products = data['products']
        self.responsible = data['responsible']
        self.transaction = data['transaction']
        self.added = datetime.strptime(data['added'], date_format)
        if not data['changed'] is None:
            self.changed = datetime.strptime(data['changed'], date_format)
        else:
            self.changed = None


class ExpandedBill:
    id: int
    received: datetime
    processed: Optional[datetime]
    products: Optional[List[Product]]
    responsible: Person
    transaction: ExpandedTransaction
    added: datetime
    changed: Optional[datetime]

    def __init__(self, data: Dict):
        self.id = data['id']
        self.received = data['received']
        self.processed = data['processed']
        self.products = [Product(data=product) for product in data['products']]
        self.responsible = Person(data=data['responsible'])
        self.transaction = ExpandedTransaction(data['transaction'])
        self.added = datetime.strptime(data['added'], date_format)
        if not data['changed'] is None:
            self.changed = datetime.strptime(data['changed'], date_format)
        else:
            self.changed = None


class UpdateBill:
    id: int
    received: datetime
    processed: Optional[datetime]
    product_ids: Optional[List[int]]
    responsible: Person
    added: datetime
    changed: Optional[datetime]
    transaction_id: int
    transaction_description: Optional[str]
    transaction_sender: int
    transaction_sender_local: bool
    transaction_receiver: int
    transaction_receiver_local: bool
    transaction_added: datetime
    transaction_changed: Optional[datetime]
    money_node_id: int
    money_branch: Branch
    money_change: int
    money_currency: Currency
    money_processed: bool
    money_added: datetime
    money_changed: Optional[datetime]

    def __init__(self, data: Dict):
        self.id = data['id']
        self.received = datetime.strptime(data['received'], date_format)
        if not data['processed'] is None:
            self.processed = datetime.strptime(data['processed'], date_format)
        else:
            self.processed = None
        self.products = [Product(data=product).id for product in data['products']]
        self.responsible_id = Person(data=data['responsible']).id
        self.added = datetime.strptime(data['added'], date_format)
        if not data['changed'] is None:
            self.changed = datetime.strptime(data['changed'], date_format)
        else:
            self.changed = None

        self.transaction_id = data['transaction']['id']
        self.transaction_description = data['transaction']['description']
        self.transaction_sender = data['transaction']['sender']['id']
        self.transaction_sender_local = data['transaction']['sender_local']
        self.transaction_receiver = data['transaction']['receiver']['id']
        self.transaction_receiver_local = data['transaction']['receiver_local']
        self.money_node_id = data['transaction']['money_node']['id']
        self.money_branch = data['transaction']['money_node']['branch']
        self.money_change = data['transaction']['money_node']['change']
        self.money_currency = data['transaction']['money_node']['currency']
        self.money_processed = data['transaction']['money_node']['processed']

        self.transaction_added = datetime.strptime(data['transaction']['added'], date_format)
        if not data['transaction']['changed'] is None:
            self.transaction_changed = datetime.strptime(data['transaction']['changed'], date_format)
        else:
            self.transaction_changed = None

        self.money_added = datetime.strptime(data['transaction']['money_node']['added'], date_format)
        if not data['transaction']['money_node']['changed'] is None:
            self.money_changed = datetime.strptime(data['transaction']['money_node']['changed'], date_format)
        else:
            self.money_changed = None


class Depodraw:
    id: int
    description: Optional[Branch]
    transaction_up: int
    transaction_down: int
    added: datetime
    changed: Optional[datetime]

    def __init__(self, data: Dict):
        self.id = data['id']
        self.branch = data['branch']
        self.change = data['change']
        self.currency = data['currency']
        self.processed = data['processed']
        self.added = datetime.strptime(data['added'], date_format)
        if not data['changed'] is None:
            self.changed = datetime.strptime(data['changed'], date_format)
        else:
            self.changed = None


class UpdateDepodraw:
    id: int
    description: Optional[str]
    transaction_up_name: str
    transaction_down_name: str
    transaction_up: int
    transaction_down: int
    change: int
    currency: Currency
    processed: bool
    is_bank_up: bool
    added: datetime
    changed: Optional[datetime]

    def __init__(self, data: Dict):
        self.id = data['id']
        self.description = data['description']
        self.transaction_up = data['transaction_up']['id']
        self.transaction_down = data['transaction_down']['id']
        self.change = data['transaction_down']['money_node']['change']
        self.currency = data['transaction_down']['money_node']['currency']
        self.added = datetime.strptime(data['added'], date_format)
        self.changed = data['changed']

        if data['transaction_up']['id'] == 1:
            self.transaction_up_name = "SMV Account"
            self.transaction_down_name = "SMV Register"
        else:
            self.transaction_up_name = "SMV Cash Register"
            self.transaction_down_name = "SMV Account"


class StatementOfAccount:
    id: int
    description: Optional[datetime]
    starting: datetime
    ending: datetime
    added: datetime
    changed: Optional[datetime]

    def __init__(self, data: Dict):
        self.id = data['id']
        self.description = data['description']
        self.starting = data['starting']
        self.ending = data['ending']
        self.added = datetime.strptime(data['added'], date_format)
        if not data['changed'] is None:
            self.changed = datetime.strptime(data['changed'], date_format)
        else:
            self.changed = None
