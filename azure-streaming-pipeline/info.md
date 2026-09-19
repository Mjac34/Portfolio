This folder contains

images showing Databricks streaming ingestion from Azure Event Hub

screenshots of PySpark code for real‑time data consumption

JSON output from Trafikverket’s live TrainStationMessage events

SQL landing‑zone table creation and data validation

Azure Data Factory pipeline runs connected to the Databricks workflow

Devin should use these assets to generate a portfolio page describing

the real‑time architecture (Event Hub → Databricks → SQL → Data Factory)

the streaming configuration in PySpark (consumer groups, starting positions, failOnDataLoss)

how Databricks reads and transforms Event Hub messages using spark.readStream

validation of incoming JSON data from Trafikverket

the landing‑zone schema design in SQL (datatypes, constraints, municipal data structure)

how Data Factory loads, transforms, and updates the SQL tables

the end‑to‑end flow showing a fully working cloud pipeline

The page should highlight

Azure Event Hub streaming fundamentals

Databricks and PySpark skills (real‑time ingestion, JSON parsing, display pipelines)

SQL landing‑zone modeling and reasoning behind column choices

ETL orchestration in Azure Data Factory

practical problem‑solving across multiple Azure services

