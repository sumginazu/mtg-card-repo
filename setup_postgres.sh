#!/bin/bash
sudo service postgresql start
rails db:migrate
rails db:migrate RAILS_ENV=test