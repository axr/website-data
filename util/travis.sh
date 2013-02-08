#!/bin/bash

root=$(git rev-parse --show-toplevel)

gem install json-schema
ruby "$root/util/validator/validate.rb"

if [ "$?" -eq 0 ]; then
	# Tell our web server to try to deploy the data
	curl -X POST --silent "http://deploy.axr.vg/website-data.php" > /dev/null
else
	exit 1
fi

echo "Finished"
