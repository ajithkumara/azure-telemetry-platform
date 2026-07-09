from producer.eventhub_producer import EventHubProducer

producer = EventHubProducer()

print("✅ Connected successfully.")

producer.close()

print("✅ Closed successfully.")