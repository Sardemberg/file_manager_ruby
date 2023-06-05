module Commands
    class Open < BaseCommand
        def initialize(params)
            @current_path = params[:current_path]
            @user_params = params[:user_params]
        end
        
        def process
            @directory ||= @user_params

            result = check
            
            unless result
                puts "This directory does not exists".red
            end

            if @directory == ".."
                current_path_array = @current_path.split("/")
                current_path_array.pop
                return current_path_array.join("/")
            end

            "#{@current_path}/#{@directory}"
        end

        def self.description
            puts "cd <path>"
        end

        private

        def check
            Dir.entries(@current_path).each do |info|
                return true if @directory == info
            end

            false
        end
    end
end