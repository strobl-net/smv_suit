from datetime import datetime
from typing import Dict


class Person(object):
    id = -1
    name = "error person"
    email = ""
    phone = ""
    tags = []
    added = "-1"
    changed = ""

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


class Organisation(object):
    id = -1
    name = "error person"
    description = ""
    site: str
    location: str
    added = "-1"
    changed = ""

    def __init__(self, data: Dict):
        self.id = data['id']
        self.name = data['name']
        self.description = data['description']
        self.site = data['site']
        self.location = data['location']
        self.added = datetime.strptime(data['added'], "%Y-%m-%dT%H:%M:%S.%f")
        if not data['changed'] is None:
            self.changed = datetime.strptime(data['changed'], "%Y-%m-%dT%H:%M:%S.%f")


class TransactionEntity(object):
    id = -1
    description = ""
    organisation: int
    person: int
    iban = ""
    bic = ""
    added = "-1"
    changed = ""

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