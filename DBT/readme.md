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