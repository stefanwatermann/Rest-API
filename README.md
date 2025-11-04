# XOJO REST Api Framework
This project can be used to build RESTful API's using XOJO Web.
The idea for this implementation is loosely based on the concept of the DOTNET WebAPI Framework.

## Prerequisists
You need to have a valid XOJO (Professional) license to use this framework.

## Usage
Clone the project and open it in the XOJO development environment.
Consult the App/Readme file for more details.

The sample project consists of two sample REST API's: 
- /api/test 
- /api/ping

Run the project and do REST calls to teh API endpoints.

-  Request: `curl -H "Authorization: Basic SGVsbG86V29ybGQ=" http://localhost:8080/api/ping`
-  Response: 04.11.2025, 18:06:27

-  Request: `curl -H "Authorization: Basic SGVsbG86V29ybGQ=" -H "X-API-KEY: ThisIsMySecureApiKey" http://localhost:8080/api/test`
-  Response: {"Name":"Willi","Email":"willi@bla.com"}

To create a new API application just copy Lib/RestApi to a new XOJO Web App and folow the instaructions in RestApi/Usage. 
