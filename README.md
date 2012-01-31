# Capistrano-CloudFoundry

A simple integration wrapper for Capistrano and Cloud Foundry-based clients. [Blue/green](http://martinfowler.com/bliki/BlueGreenDeployment.html) deployments are currently automated.

## Usage

The [features](https://github.com/hatofmonkeys/capistrano-cloudfoundry/tree/master/features) give an example of multi-stage usage. A simple Capistrano configuration is shown below.

    require 'capistrano-cloudfoundry'
    set :application, "env-test"
    set :user, "test@test.com"
    set :passwd, "password"
    set :target, "api.prod-hatofmonkeys.com"
    set :url, "env-test.prod-hatofmonkeys.com"

The application can then be deployed in the following way.

    # cap cloudfoundry

## Warning

This code currently has no error checking, practically no features, and is generally dangerous. Use at your own risk.

## Testing

Copy features/support/config.rb.sample to features/support/config.rb and modify with your own Cloud Foundry settings.

    # bundle install
    # rake

## Contributing

Please, please, please fork this, improve it, and issue a pull request. You know you want to.