from datetime import datetime
from typing import Dict
from typing import Optional


class Person(object):
    id = -1
    name = "?XD"
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
        self.added = datetime.strptime(data['added'], "%Y-%m-%dT%H:%M:%S.%f")
        if not data['changed'] is None:
            self.changed = datetime.strptime(data['changed'], "%Y-%m-%dT%H:%M:%S.%f")
        else:
            self.changed = None


class Organisation(object):
    id = -1
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
        self.added = datetime.strptime(data['added'], "%Y-%m-%dT%H:%M:%S.%f")
        if not data['changed'] is None:
            self.changed = datetime.strptime(data['changed'], "%Y-%m-%dT%H:%M:%S.%f")
        else:
            self.changed = None


class TransactionEntity(object):
    id = -1
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
        self.added = datetime.strptime(data['added'], "%Y-%m-%dT%H:%M:%S.%f")
        if not data['changed'] is None:
            self.changed = datetime.strptime(data['changed'], "%Y-%m-%dT%H:%M:%S.%f")
        else:
            self.changed = None
