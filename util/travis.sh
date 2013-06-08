#!/bin/bash

set -e

root=$(git rev-parse --show-toplevel)

gem install json-schema
ruby "$root/util/validator/validate.rb"
