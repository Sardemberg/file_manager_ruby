require_relative './base_command'
require 'colorize'

module Commands
    class List < BaseCommand
        def initialize(params)
            @current_path = params[:current_path]
            @custom_path = params[:custom_path]
        end
        
        def process
            if @custom_path
                show_files(@custom_path)
            else
                show_files(@current_path)
            end
        end

        def self.description
            puts "ls <path>"
        end

        private

        def show_files(path)
            Dir.entries(path).each do |info|
                puts info.blue
            end
        end
    end
end