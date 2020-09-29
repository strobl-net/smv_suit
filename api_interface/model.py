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
    tags: Optional[List[int]]
    added: datetime
    changed: Optional[datetime]

    def __init__(self, data: Dict):
        self.id = data['id']
        self.name = data['name']
        self.description = data['description']
        self.change = data['change']
        self.currency = data['currency']
        self.provider = data['provider']
        self.tags = data['tags']
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


class Depodraw:
    id: int
    description: Optional[Branch]
    transaction_up: int
    transaction_down: Currency
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
