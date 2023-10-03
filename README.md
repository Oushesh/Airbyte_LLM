## Why is ETL important in LLM?
   Lots of data. As the number of frameworks available increase
   there is a problem that lots of connectors have to be written
   over and over again resulting in high engineering costs from teams.

   As cloud computing came over, the costs of scaling went drastically
   down and ETL was bound to exist. ETL provides (Extract data from source
   connector, Transform the Data carry over to the Destination Connector.)
  
    ETL vs ELT.
    ETL: Extract Transform Load
    Extract Load and then Transform (this one is more frequent since 
    its easier to transport the data to destination and transform
    based on the different teams or stakeholders needs: example:
    Business intelligence, Data Visualisation Tool.


    ELT defacto: really good tool
       * Extract from Source Connector
         Load - Databases: Supabase, posgresql
                Datawarehouses: eg. Snowflake (holds data ready for consumption)
                DataLakes: eg. s3 Buckets (holds all structured types)
    
         * Transform - dbT (write sql models on top of the data)
         * Goal: Derive Insights to help better sales.     


## Example of ELT System
   Source Connector (e.g. Salesforce, hubspot, JSON, Notion) ---> Frontend API pulls data 
   ---> Desintation Connector (s3 as Datalake or Snowflake as Datawarehouse).


   Option 1: In the past, you could have the scripts written manually in python to do so (api grabbing the data ) but over the years
   the cost of compute has been significantly decreased such that it makes sense to go for option 2.
    
   Option 2: ELT Tool
   Sales (Input) Connector --> Airbyte --> Snowflake Connector processed by dBT.

## Example Project: 
   Low Key CDK for the connectors and how to test the connectors before setting into production.
    https://www.youtube.com/watch?v=LQ2RqsrxIRc 

## Airbyte Advantage:
   A lot of other tools and sources are paid per data or stream. Airbyte is free and cover most of 
   the usecases. You pay only if you dont want to pay to configure for the connectors manually.
   The airbyte CDK is good for that.
   
   Offers huge advantage: new airbyte CDK

## References:
   Example: Open Source Data Integration: https://wwws.youtube.com/watch?v=oeshl0H1JcU
   https://github.com/airbytehq/airbyte/tree/master
    Google Sheets API (Source Connector) --> Snowflake (Destination Connector)

## Custom Connector
    How and why before?
![airbyte](airbyte.png)

## Airbyte under the Hood:
   For each Data Source you have: airbyte connector has to be setup.
   

## Airbyte CDk

## No Code API Connectors or Low Code CDK:
   * https://docs.airbyte.com/connector-development/connector-builder-ui/tutorial
   * No Code Builder: https://www.youtube.com/watch?v=g_NZPHVNB38

      Example building an API to Ingest Data from Platfrom Seatgeek.com
      http://platform.seatgeek.com/

      Always 2 things are needed: Base Url which almost all endpoints provide +
      endpoint entry and authentication key.
      Its a good idea to test your endpoint using Postman.
      Terminologies: A stream in Airbyte is an endpoint 

      now a company or enterprise makes several endpoints available 

      The advantage of the new Airbyte connector is you can test the endpoints
      right on the terminal. Previously I used to test on Postman or those kinds of tools.

      The other advantage is the record selector. 

      The advantage is also: the incremental sync for large data. You could have written the entire code to filter the data by hand but airbyte helps you with that. Incremental Sync has data filters. 
      Some of them have sorting options given by the api endpoint from which
      we are injesting data.

      Now we could build custom Data endpoints on Django or so to get the filters done or use Airbyte with robust connectors.


      In terms of testing we can do multiple calls of the api endpoints here: 
      Nested Calls one query feeds into the other one.      
      Case: 
         - Seatgeek: 
            - Secret: e37569bd5f4aa77fd499847a6416e75ca4fb167da115feaeea6bde5a4d8aea4a

            - Client_ID: 
            MzcwMTY3Mjl8MTY5NTc5NzkxMS45MDA0MTk 

      Other Things with 
   
   * Case 2: 
     * Why airbyte? Production ready connectors and UI + scaling advantages.
     * Airbyte with LLM: check and apply the tutorial needed.
     * Example

## Why having a pipeline monitoring tool?
   Monitor how things are progressing: Dagster DAG Graph tool.
   Folder: dagster

## References:
   * https://github.com/airbytehq/airbyte/blob/master/docs/understanding-airbyte/basic-normalization.md#Rules
   * https://docs.airbyte.com/understanding-airbyte/basic-normalization/