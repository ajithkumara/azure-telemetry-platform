# Azure Telemetry Platform

A Python-based telemetry platform that ingests streaming data from Azure Event Hubs and writes it to Azure Data Lake Storage (ADLS) Gen2.

## Project Structure

```
azure-telemetry-platform/
│
├── .env                  # Local environment configuration
├── .gitignore            # Git ignore file
├── README.md             # Project documentation
├── requirements.txt      # Project dependencies
│
├── config/               # Configuration settings
│     ├── __init__.py
│     └── settings.py
│
├── producer/             # Telemetry generator / producer
│     ├── __init__.py
│     └── producer.py
│
├── consumer/             # Event processor / consumer
│     ├── __init__.py
│     └── consumer.py
│
├── data/                 # Local data cache/temp storage
├── logs/                 # Application log directory
├── notebooks/            # Jupyter notebooks for analysis/exploration
├── scripts/              # Helper scripts
└── tests/                # Unit and integration tests
```

## Setup & Running

1. Create a `.env` file with appropriate Azure credentials and connection strings.
2. Install dependencies:
   ```bash
   pip install -r requirements.txt
   ```
