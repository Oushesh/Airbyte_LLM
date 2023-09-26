# Airbyte_LLM
This is a test project to get data from different sources: for LLM

## ELT defacto: really good tool
   * Extract - API, Database
   * Load - Databases: eg.
   *        Datawarehouses: eg. Snowflake
   *        DataLakes: eg. s3 Buckets 

   * Transform - dbT (write sql models on top of the data)

## Terminologies Understanding:
    As the word says data being from raw to being converted --> DataLakes (raw data) --> DataWarehouse(converted Data as in processed Data) ready to be consumed by neural networks. 

## Goal:
   With all those Data then you can derive insights: 

## Example of ELT System
   API from the Frontend pulls from a source eg. Salesforce or JSON, Notion and move 
   to our destination (S3 or Snowflake as Datawarehouse). 
   Option 1: You could have the scripts written manually in python to do so. but over the years
   the cost of compute has been significantly decreased such that it makes sense to go for option 2.
    
   Option 2: ELT Tool

   Sales (Input) Connector --> Airbyte --> Snowflake Connector processed by dBT.

## ETL vs ELT System
   * ETL eg. : Salesforce --> Script for Transform --> Snowflake.
   * Advantages of ETL vs ELT --> In the case your raw Data is needed by several Stakeholders
     like Business Team, Advertising Team or other teams. You can in theory move all the information
     to destination source and finally transform it individually for different teams. (Transfer and sync once)

## Example Project: 
    Low Key CDK for the connectors and how to test the connectors before setting into production.
    https://www.youtube.com/watch?v=LQ2RqsrxIRc 

## Why airbyte?
   A lot of other tools and sources are paid per data or stream. Airbyte is free and cover most of 
   the usecases. You pay only if you dont want to pay to configure for the connectors manually.
   The airbyte CDK is good for that.

## References:
   https://www.youtube.com/watch?v=oeshl0H1JcU

## Getting Started
   https://github.com/airbytehq/airbyte/tree/master
   
## Custom Connector
    How and why before?
![airbyte](airbyte.png)

## Airbyte under the Hood:
   For each Data Source you have: airbyte connector has to be setup. 
   Example:

## Airbyte CDk

## No Code API Connectors or Low Code CDK:
   * https://docs.airbyte.com/connector-development/connector-builder-ui/tutorial
   * TODO: build a sample to do so.
   * Similar 