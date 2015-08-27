# Getting Started Guide

Food52 is using [Middleman](http://middlemanapp.com/getting-started/) to construct and preview email newsletters.

## Setup Instructions

### Git Repo
* `git clone -b git@github.com:food52/email-guide.git`
* `cd email-guide`
* `gem install bundler`
* `bundle exec middleman` (to run in your local browser)`

### Heroku Setup
* `git remote add heroku YOUR_HEROKU_CONFIG`

## Building and Previewing Instructions

## Building
This builds all the static emails in a separate build folder in the root of the project. The emails can then be copied and pasted into a new or existing template.
* `bundle exec middleman build` (to generate a build)`

## Deploying Instructions
* `rake heroku:deploy`
