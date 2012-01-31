require 'capistrano-cloudfoundry/application'

module CapistranoCloudfoundry
  class Target
    attr_reader :url
    def initialize(url,user,passwd)
      @url = url
      #set up the client
      #vmc target
      `vmc target #{url}`
      #vmc login
      `vmc login --user #{user} --passwd #{passwd}`
    end
  end
end