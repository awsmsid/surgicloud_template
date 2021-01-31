require 'rails/generators'

module SurgicloudLayout
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)
      argument :directory_name, :type => :string, :default => "simple"

      desc "Creates Surgicloud layout files."

      attr_reader :app_name

      # Create an application layout file with partials for messages and navigation
      def generate_layout
        file_list = ["#{directory_name}/index.html.erb", "layouts/_header.html.erb", "layouts/_navigation_menu.html.erb"]
        file_list.each do |file_to_create|
          file = "app/views/#{file_to_create}"
          if File.exists?(file)
            print("file: #{file} already exist. do you want to replace it? \n")
            print("Press Y or N? ")
            user_input = STDIN.gets.chomp
            if user_input.downcase == 'y'
              Dir.mkdir(directory_name) unless File.directory?(directory_name)
              copy_file file.split("/").last, file
            end
          else
            Dir.mkdir(directory_name) unless File.directory?(directory_name)
            copy_file file.split("/").last, file
          end
        end
      end
    end
  end
end
