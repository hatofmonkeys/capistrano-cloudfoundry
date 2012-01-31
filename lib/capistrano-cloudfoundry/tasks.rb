require 'capistrano'

Capistrano::Configuration.instance(:must_exist).load do

  namespace :cloudfoundry do
    #down to business
    desc <<-DESC
      Deploys your project.
    DESC
    task :default do
      login
      push
    end
    task :login do
      #Get logged in
      set :vmc_target, CapistranoCloudfoundry::Target.new(target,user,passwd)
    end
    task :push do
      #push the app
      cf_app = CapistranoCloudfoundry::Application.new(application,url,vmc_target)
      cf_app.push
    end
  end

end