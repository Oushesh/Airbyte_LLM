## Tutorial for building Custom_connector
   * Steps needed to create an http source connector
   * As of the new beta connectors can be created using the
     UI from the airbyte portal itself.

## Steps involved:
   * Into the cloned repository of airbyte:
     cd airbyte-integrations/connector-templates/generator/
     ./generate.sh
   * Select python-http example-api
   * Give a name of the connector: example: python-http-example-connector
       
   The template will create the specific connector under 
   connectors/source-python-http-example-connector 
    
    This will automatically create a source-folder name. like: source-python-connector-example
    and destination-python-connector-example to replicate the concept of source and destination connectors
    of airbyte. Also each folder the source and destination already comes with its own requirements.txt to isolate
    its testing, and its own unit_test file. In Airbyte every
    connection source-ETl-destination is called a stream. The folder
    contains a test for incremental_test and stream test individually
    such that the endpoints for data are tested prior to production.

    Create a virtual env folder inside the source folder to isolate the dependencies needed
    then: 

## Case:
   1. Poke http tutorial: source_connector for exchange connector:
   * Reference: https://docs.airbyte.com/connector-development/config-based/tutorial/getting-started

## DBT Example Project:
   * https://github.com/dbt-labs/jaffle_shop

## File Structure: 

## Configuration Based Source

## Example of Schema from an api:
   Once you get the schema from the exchange api. Save it
   as a json file to serve for how 
   
## Dbt x Snowflake:
    https://quickstarts.snowflake.com/guide/data_teams_with_dbt_cloud/?index=../..index#15
   