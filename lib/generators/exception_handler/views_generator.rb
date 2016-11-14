module ExceptionHandler
  class ViewsGenerator < Rails::Generators::Base

    #Views
    VIEWS = %w(views controllers models assets)

    #Options
    class_option :files, aliases: "-v", default: VIEWS, type: :array, desc: "Select file types (views, models, controllers, assets)"

    #Needed to reference files
    source_root File.expand_path("../../../../app", __FILE__)

    ###########################################

    #Files
    def create_files
      generate_files options.files
    end

    ###########################################

    protected

    #File Generator
    def generate_files args

      #Valid?
      return raise args.inspect unless args.nil? || (args-VIEWS).empty?

      #Types
      for arg in args do
        directory arg, "app/#{arg}"
      end

      #Success
      puts "Files transferred successfully"
    end

    ###########################################

  end
end
