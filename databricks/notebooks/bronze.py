# Databricks notebook source
# bronze.py — Bronze Layer: Raw Ingestion from ADLS
#
# Reads raw JSON telemetry events from Azure Data Lake Storage (ADLS Gen2)
# into the Bronze layer with no transformation applied.

# COMMAND ----------

from pyspark.sql import SparkSession

# ---------------------------------------------------
# CONFIGURATION — Override via Databricks widgets or
#                 DLT pipeline configuration params
# ---------------------------------------------------
STORAGE_ACCOUNT = "stmscaidev2026"
CONTAINER       = "datalake"
BASE_PATH       = f"abfss://{CONTAINER}@{STORAGE_ACCOUNT}.dfs.core.windows.net"

# Partition to read (use widgets for parameterization)
dbutils.widgets.text("year",  "2026")
dbutils.widgets.text("month", "07")
dbutils.widgets.text("day",   "04")

YEAR  = dbutils.widgets.get("year")
MONTH = dbutils.widgets.get("month")
DAY   = dbutils.widgets.get("day")

BRONZE_PATH = f"{BASE_PATH}/bronze/year={YEAR}/month={MONTH}/day={DAY}/"

# ---------------------------------------------------
# READ RAW JSON FROM BRONZE
# ---------------------------------------------------
print(f"[Bronze] Reading raw telemetry from: {BRONZE_PATH}")

bronze_df = (
    spark.read
    .option("multiLine", False)
    .json(BRONZE_PATH)
)

print(f"[Bronze] Record count: {bronze_df.count()}")
bronze_df.printSchema()
bronze_df.show(5, truncate=False)
