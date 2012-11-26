
require 'rubygems'
require 'bundler/setup'

require 'locomotive_plugins'

# This is a quick-and-dirty basic authentication plugin. The login string and
# password are stored in plaintext in the config hash, so it is not secure. The
# configuration also takes a regular expression which specifies the page
# fullpaths which require basic authentication
module BasicAuth
  class BasicAuth

    include Locomotive::Plugin

    before_filter :authenticate_if_needed

    def config_template_file
      File.join(File.dirname(__FILE__), 'basic_auth', 'config.haml')
    end

    def authenticate_if_needed
      authenticate if need_to_authenticate?
    end

    protected

    def authenticate
      controller.authenticate_or_request_with_http_basic do |username, password|
        username == config['login'] && password == config['password']
      end
    end

    def need_to_authenticate?
      fullpath =~ Regexp.new(config['fullpath_regex'])
    end

    def fullpath
      controller.params['path'] || ''
    end

  end

  LocomotivePlugins.register_plugin(BasicAuth)

end
