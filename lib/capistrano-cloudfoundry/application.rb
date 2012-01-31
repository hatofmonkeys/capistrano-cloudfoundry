require 'capistrano-cloudfoundry/target'
module CapistranoCloudfoundry
  class Application
    attr_reader :name, :url, :target
    def initialize(name, url, target)
      @name = name
      @url = url.match(%r/http[s]?:\/\/([^\/]+)/) ? url.match(%r/http[s]?:\/\/([^\/]+)/)[1] : url
      @target = target
    end
    def push
      #deploy the app
      apps = `vmc apps`
      case
        when apps.match(%r/#{@name}-blue *\|[^\|]*\|[^\|]*\| .*#{@url}/)
          @old_deploy = "blue"
          @deploy = "green"
        when apps.match(%r/#{@name}-green *\|[^\|]*\|[^\|]*\| .*#{@url}/)
          @old_deploy = "green"
          @deploy = "blue"
        else
          @deploy = "blue"
      end
      if apps.include?(" #{@name}-#{@deploy} ") then
        puts `vmc update #{@name}-#{@deploy}`
      else
        puts `vmc push #{@name}-#{@deploy} -n`
      end
      apps = `vmc apps`
      if apps.match(%r/#{@name}-#{@deploy}[ ]*\|[^\|]*\| RUNNING/) then
        @old_deploy ? `vmc unmap #{@name}-#{@old_deploy} #{@url}` : nil
        `vmc map #{@name}-#{@deploy} #{@url}`
      end
    end
  end
end