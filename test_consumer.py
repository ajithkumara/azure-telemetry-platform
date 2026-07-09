from azure.eventhub import EventHubConsumerClient

from config.settings import settings


def on_event(partition_context, event):
    print("=" * 70)
    print("Partition:", partition_context.partition_id)
    print("Offset:", event.offset)
    print("Sequence:", event.sequence_number)
    print(event.body_as_str())


client = EventHubConsumerClient.from_connection_string(
    conn_str=settings.eventhub.connection_string,
    consumer_group="$Default",
    eventhub_name=settings.eventhub.hub_name,
)

print("Waiting for events...")

with client:
    client.receive(
        on_event=on_event,
        starting_position="@latest",
    )