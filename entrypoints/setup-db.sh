#!/bin/bash

bundle exec rake db:create
bundle exec rake db:migrate


# models:
    # player
    # round
    # categories
    # questions
    # answers
    # options

# uma question tem várias options e 1 answer
#