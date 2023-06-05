require_relative './utils'

module Commands
    class Mkdir < BaseCommand
        include Commands::Utils

        def initialize(params)
            @current_path = params[:current_path]
            @user_params = params[:user_params]
        end

        def self.description
            puts "mkdir <name_dir_or_file>"
        end

        def process
            @name_dir ||= @user_params

            if check_dir(@current_path, @name_dir)
                puts "This folder does exists".red
                return
            end

            Dir.mkdir("#{@current_path}/#{@name_dir}")
        end
    end
end