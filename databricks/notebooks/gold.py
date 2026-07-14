# Databricks notebook source
# gold.py — Gold Layer: Aggregated KPI Metrics
#
# Reads from the Silver Delta table and produces vehicle-level
# KPI aggregations (avg speed, engine temp, fuel, max odometer)
# partitioned by date, written as Gold Delta.

# COMMAND ----------

from pyspark.sql.functions import avg, max, min, count

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

SILVER_PATH = f"{BASE_PATH}/silver/telemetry/"
GOLD_PATH   = f"{BASE_PATH}/gold/telemetry_kpis/"

# ---------------------------------------------------
# READ SILVER (DELTA)
# ---------------------------------------------------
print(f"[Gold] Reading silver layer from: {SILVER_PATH}")

silver_df = (
    spark.read
    .format("delta")
    .load(SILVER_PATH)
    .filter(
        (silver_df["year"]  == int(YEAR))  &
        (silver_df["month"] == int(MONTH)) &
        (silver_df["day"]   == int(DAY))
    )
)

# ---------------------------------------------------
# GOLD AGGREGATION: VEHICLE-LEVEL KPIs per Day
# ---------------------------------------------------
gold_df = (
    silver_df
    .groupBy("vehicleId", "year", "month", "day")
    .agg(
        count("eventId").alias("total_events"),
        avg("speedKmh").alias("avg_speed_kmh"),
        max("speedKmh").alias("max_speed_kmh"),
        min("speedKmh").alias("min_speed_kmh"),
        avg("engineTemperatureC").alias("avg_engine_temp_c"),
        avg("fuelLevelPercent").alias("avg_fuel_level_pct"),
        avg("batteryVoltage").alias("avg_battery_voltage"),
        max("odometerKm").alias("max_odometer_km"),
    )
)

print(f"[Gold] Aggregated {gold_df.count()} vehicle-day KPI rows.")
display(gold_df)

# ---------------------------------------------------
# WRITE GOLD (DELTA — partition by date)
# ---------------------------------------------------
print(f"[Gold] Writing to: {GOLD_PATH}")

(
    gold_df.write
    .format("delta")
    .mode("overwrite")
    .option("overwriteSchema", "true")
    .partitionBy("year", "month", "day")
    .save(GOLD_PATH)
)

print("[Gold] Write complete.")
