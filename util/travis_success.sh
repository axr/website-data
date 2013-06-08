#!/bin/bash

# Tell our web server to try to deploy the data
curl --silent "http://deploy.axrproject.org/deploy.php?name=www-data-delayed" > /dev/null
