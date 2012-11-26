
require 'rubygems'
require 'bundler/setup'

module BasicAuth
  class BasicAuth
    include Locomotive::Plugin
  end

  LocomotivePlugins.register_plugin(BasicAuth)

end
