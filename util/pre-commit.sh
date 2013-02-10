#!/bin/bash

cd "$(git rev-parse --show-toplevel)"
ruby ./util/validator/validate.rb

exit $?
