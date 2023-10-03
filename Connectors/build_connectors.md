## Connectors: Source, Destination from Airbyte.
   * git clone  airbyte-integrations/connectors/destination-python-http-example/
     Go to: connectors/source-connector-name/
   * ./run-ab-platform.sh will spin the docker
     and allow to connect with html webpage

## Building a Connector: 
   * Go to the template: ./generate.sh
     Choose simple connector. 
     A connector will be built with its own testing environment, pytest
     folder, requirements.txt where you can test the connector separately.
     
     Directory:
     -- Dockerfile                                                                             
     -- README.md                                                                                     
     -- __init__.py                                                                               
     -- acceptance-test-config.yml                                     
     -- acceptance-test-docker.sh
     -- build.gradle
     -- virtual_env/ 
     -- integration_tests
     -- secrets/ --> Folder containing the config.json
     -- integration_tests/ --> acceptance.py, invalid_config.json with sample 
        of invalid data, sample_config.json with sample for acceptable data 
     -- manifest.yaml --> Defines the connector, base url and the specific sub-endpoints.
     -- acceptance-test-docker.sh
     -- main.py

   * Activate Environment then: 
     python main.py