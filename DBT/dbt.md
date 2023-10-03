## DBT for the Transformation of the Tables:
* Normalisation: why? Normalisation?
     - In the scenario of having a source connector with tables and sending to
       a destination connector. Sometimes in the tables some raws might contain
       some json blob. The process of expanding those json parts is called Normalisation.
       aka. making the data normal under the schema: "header", "single data entry".
* The other unfair advantage of Airbyte is the fact that DBT is used internally
  to adapt the SQL Dialects to the destination queries. (e.g Big Query has different sql dialect than snowflake.)

  The following will explain the example of Normalisation:

  Let's assume we have the output from an api:
  From source api:
  {
  "make": "alfa romeo",
  "model": "4C coupe",
  "horsepower": "247"
  }

  The data output will be in json format. And the table created for Posgresql or other things will be like:

    CREATE TABLE "_airbyte_raw_cars" (
     -- metadata added by airbyte
     "_airbyte_ab_id" VARCHAR, -- uuid value assigned by connectors to each row of the data written in the destination.
     "_airbyte_emitted_at" TIMESTAMP_WITH_TIMEZONE, -- time at which the record was emitted.
     "_airbyte_data" JSONB -- data stored as a Json Blob.
     );
    
     Then a basic normalization would create the following table:
     CREATE TABLE "cars" (
    "_airbyte_ab_id" VARCHAR,
    "_airbyte_emitted_at" TIMESTAMP_WITH_TIMEZONE,
    "_airbyte_cars_hashid" VARCHAR,
    "_airbyte_normalized_at" TIMESTAMP_WITH_TIMEZONE,

    -- data from source
    "make" VARCHAR,
    "model" VARCHAR,
    "horsepower" INTEGER
    );
    
    CREATE TABLE "cars" (
    "_airbyte_ab_id" VARCHAR,
    "_airbyte_emitted_at" TIMESTAMP_WITH_TIMEZONE,
    "_airbyte_cars_hashid" VARCHAR,
    "_airbyte_normalized_at" TIMESTAMP_WITH_TIMEZONE,

    -- data from source
    "make" VARCHAR,
    "model" VARCHAR,
    "horsepower" INTEGER
    );
           
    Example 2: Nested Objects:
    {
        "make": "alfa romeo",
        "model": "4c coupe",
        "powertrain_specs":{"horsepower":247,"transmission": "6-speed"}
    }

    After normalisation we have:
    CREATE TABLE "cars" (
    "_airbyte_cars_hashid" VARCHAR,
    "_airbyte_emitted_at" TIMESTAMP_WITH_TIMEZONE,
    "_airbyte_normalized_at" TIMESTAMP_WITH_TIMEZONE,

    "make" VARCHAR,
    "model" VARCHAR
    );
    
    CREATE TABLE "powertrain_specs" (
    "_airbyte_powertrain_hashid" VARCHAR,
    "_airbyte_cars_foreign_hashid" VARCHAR,
    "_airbyte_emitted_at" TIMESTAMP_WITH_TIMEZONE,
    "_airbyte_normalized_at" TIMESTAMP_WITH_TIMEZONE,
    
        "horsepower" INTEGER,
        "transmission" VARCHAR
    );

There are some metadata columns that are produced and transferred
from destination core to the end table.

    Why normalisation? Well, simply because the Business Analytics 
    team and visualisation team need visualisations from libraries like:
    Tableau, Metabase and these work primarily using Pandas Dataframe, Apache
    Parquet files, column data.
    
    Thats the result why we chose 

* Deduping and why:
* https://www.youtube.com/watch?v=I4fngMnkJzY&t=184s

## DBT
* Example Tutorial on DBT



## DBT Powerful Tool
   * Performs transformations on input data which are found in your datawarehouse
     eg. Snowflake or S3
   * Advantages: Gives a flow of software engineering similar to git versioning
     to your data. 

## The T in the ELT stands for transformation.
   * General structure of a project: 
     dbt_project.yml (configuration file for a dbt)
     file is a configuration file for a dbt 
     (data build tool) project. 
     dbt is a command-line tool that enables data analysts 
     and engineers to transform data in their warehouse more 
     effectively by allowing them to write modular SQL queries, 
     version control their analytics code, and leverage analytics 
     engineering best practices.

     Example of dbt_project.yml:
     * model-paths: path to directories where dbt models
     are located. Models are essentially SQL files containing
     transformations and analytics logic. 
     
     * seed-path: directories containing seed data. Seed data is
     initial set of data for testing before the data is found.
     
      * test-paths: directories where test files are located. Tests
      are used for validating your data transformations
     
      * analysis-paths: Specifies the directories where
        analysis files contain dbt SELECT statements

    Use of concepts like macros from software engineering into sql.
    Example: -- Define a macro to calculate the average of a column
     Macro Definition:
     {% macro calculate_average(column_name) %}
     SELECT AVG({{ column_name }}) as average_value
     {% endmacro %}
     
     Using Macro again in the model:
     -- Reference the macro in a model
     {{ calculate_average('column_name') }}

## Input File: csv
   Then the data is seeded to dbt using .csv
   

## References: 
   * https://www.youtube.com/watch?v=qOx8l_QFz9I&list=PLy4OcwImJzBLJzLYxpxaPUmCWp8j1esvT&index=2
   * https://github.com/dbt-labs/jaffle_shop/tree/main/models
      Sample problem: DBT Models in an example scenario: Jaffle_Shop
   * https://docs.getdbt.com/docs/core/pip-install