#!/bin/bash

# this is a quick and dirty hack for demonstration purposes

set -e

rails db:drop db:create db:migrate db:seed db:seed_test_data
puma -C config/puma.rb -e development -p 3000