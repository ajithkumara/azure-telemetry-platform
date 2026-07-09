# Azure Telemetry Platform

A Python-based telemetry platform that ingests streaming data from Azure Event Hubs and writes it to Azure Data Lake Storage (ADLS) Gen2.

## Project Structure

```
azure-telemetry-platform/
│
├── producer/             # Telemetry generator / producer
│     ├── __init__.py
│     └── eventhub_producer.py
│
├── consumer/             # Event processor / consumer
│     ├── __init__.py
│     └── eventhub_consumer.py
│
├── databricks/           # Databricks notebooks and logic
│     └── notebooks/
│
├── terraform/            # Infrastructure-as-code
│     ├── modules/        # Reusable resource modules
│     │     ├── resource_group/
│     │     ├── storage/
│     │     ├── eventhub/
│     │     ├── databricks/
│     │     ├── access_connector/
│     │     ├── rbac/
│     │     └── monitoring/
│     ├── environments/   # Environment specific deployments
│     │     ├── dev/
│     │     ├── test/
│     │     └── prod/
│     └── legacy/         # Reference monolithic scripts (deprecated)
│
├── docs/                 # General documentation files
├── architecture/         # System architecture documents
├── screenshots/          # Project visual screenshots
├── .env                  # Local environment configuration
├── .gitignore            # Git ignore file
├── README.md             # Project documentation
└── requirements.txt      # Project dependencies
```

## Setup & Running

1. Create a `.env` file with appropriate Azure credentials and connection strings.
2. Install dependencies:
   ```bash
   pip install -r requirements.txt
   ```
