require_relative './utils'

module Commands
    class Remove < BaseCommand
        include Commands::Utils

        def initialize(params)
            @user_params = params[:user_params]
            @current_path = params[:current_path]
        end


        def self.description
            puts "rm <path>"
        end

        def process
            @name_dir ||= @user_params

            unless check_dir(@current_path, @name_dir)
                puts "This folder does not exists".red
                return
            end

            Dir.delete("#{@current_path}/#{@name_dir}")
        end
    end
end