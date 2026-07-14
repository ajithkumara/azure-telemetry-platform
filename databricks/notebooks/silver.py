# Databricks notebook source
# silver.py — Silver Layer: Cleansing & Transformation
#
# Reads from the Bronze layer, applies schema enforcement,
# type casting, null filtering, and writes to Silver as Delta.

# COMMAND ----------

from pyspark.sql.types import (
    StructType, StructField,
    StringType, DoubleType, BooleanType, TimestampType
)
from pyspark.sql.functions import col, to_timestamp, lit

# ---------------------------------------------------
# CONFIGURATION
# ---------------------------------------------------
STORAGE_ACCOUNT = "stmscaidev2026"
CONTAINER       = "datalake"
BASE_PATH       = f"abfss://{CONTAINER}@{STORAGE_ACCOUNT}.dfs.core.windows.net"

dbutils.widgets.text("year",  "2026")
dbutils.widgets.text("month", "07")
dbutils.widgets.text("day",   "04")

YEAR  = dbutils.widgets.get("year")
MONTH = dbutils.widgets.get("month")
DAY   = dbutils.widgets.get("day")

BRONZE_PATH = f"{BASE_PATH}/bronze/year={YEAR}/month={MONTH}/day={DAY}/"
SILVER_PATH = f"{BASE_PATH}/silver/telemetry/"

# ---------------------------------------------------
# READ BRONZE
# ---------------------------------------------------
print(f"[Silver] Reading bronze layer from: {BRONZE_PATH}")

bronze_df = (
    spark.read
    .option("multiLine", False)
    .json(BRONZE_PATH)
)

# ---------------------------------------------------
# EXPECTED SILVER SCHEMA (REFERENCE)
# ---------------------------------------------------
expected_schema = StructType([
    StructField("eventId",             StringType(),    True),
    StructField("vehicleId",           StringType(),    True),
    StructField("driverId",            StringType(),    True),
    StructField("batteryVoltage",      DoubleType(),    True),
    StructField("engineTemperatureC",  DoubleType(),    True),
    StructField("fuelLevelPercent",    DoubleType(),    True),
    StructField("heading",             DoubleType(),    True),
    StructField("ignition",            BooleanType(),   True),
    StructField("latitude",            DoubleType(),    True),
    StructField("longitude",           DoubleType(),    True),
    StructField("odometerKm",          DoubleType(),    True),
    StructField("speedKmh",            DoubleType(),    True),
    StructField("timestamp",           TimestampType(), True),
])

# ---------------------------------------------------
# SILVER TRANSFORMATION: FLATTEN + TYPE CAST
# ---------------------------------------------------
silver_df = bronze_df.select(
    col("eventId"),
    col("vehicleId"),
    col("driverId"),

    col("batteryVoltage").cast("double"),
    col("engineTemperatureC").cast("double"),
    col("fuelLevelPercent").cast("double"),
    col("heading").cast("double"),
    col("ignition").cast("boolean"),

    col("odometerKm").cast("double"),
    col("speedKmh").cast("double"),

    col("location.latitude").alias("latitude"),
    col("location.longitude").alias("longitude"),

    to_timestamp(col("timestamp")).alias("timestamp"),
)

# ---------------------------------------------------
# DATA QUALITY: DROP NULLS ON KEY FIELDS
# ---------------------------------------------------
before_count = silver_df.count()
silver_df = silver_df.dropna(subset=["eventId", "vehicleId", "timestamp"])
after_count = silver_df.count()
print(f"[Silver] Dropped {before_count - after_count} rows with null key fields.")

# ---------------------------------------------------
# ADD PARTITION COLUMNS
# ---------------------------------------------------
silver_df = (
    silver_df
    .withColumn("year",  lit(int(YEAR)))
    .withColumn("month", lit(int(MONTH)))
    .withColumn("day",   lit(int(DAY)))
)

print(f"[Silver] Writing {after_count} records to: {SILVER_PATH}")
display(silver_df)

# ---------------------------------------------------
# WRITE SILVER (DELTA — partition by date)
# Write to the root path only; partitionBy handles subfolders.
# ---------------------------------------------------
(
    silver_df.write
    .format("delta")
    .mode("overwrite")
    .option("overwriteSchema", "true")
    .partitionBy("year", "month", "day")
    .save(SILVER_PATH)
)

print("[Silver] Write complete.")
