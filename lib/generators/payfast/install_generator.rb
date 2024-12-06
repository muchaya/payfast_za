require "rails/generators"

module Payfast
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../../../..", __FILE__)

      desc "Create Payfast configuration file"

      def copy_config
        directory "config/initializers", "config/initializers"
      end
    end
  end
end
