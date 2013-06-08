#!/bin/bash

cd "$(git rev-parse --show-toplevel)"
ruby ./util/validate.rb

exit $?
