from dataclasses import dataclass


@dataclass(frozen=True)
class EventHubSettings:
    connection_string: str
    hub_name: str
    consumer_group: str


@dataclass(frozen=True)
class StorageSettings:
    account_name: str
    filesystem_name: str
    connection_string: str


@dataclass(frozen=True)
class ApplicationSettings:
    eventhub: EventHubSettings
    storage: StorageSettings
    consumer_batch_size: int