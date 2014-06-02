###########################################

require 'spec_helper'
require 'generators/exception_handler/install_generator'

###########################################

class InstallationSpec < Rails::Generators::TestCase

	#Setup
	tests ExceptionHandler::InstallGenerator
	destination File.expand_path("../../tmp", __FILE__)

	#Before
	setup do
		prepare_destination
		run_generator
	end

	#Config Installer
	test "assert Config Files Are Created" do 
		assert_file "config/initializers/exception_handler.rb"
	end

end