require "rails/generators"

module Payfast
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)

      desc "Create Payfast configuration file"

      def copy_config
        template 'config/initializers/payfast.rb'
      end
    end
  end
end
