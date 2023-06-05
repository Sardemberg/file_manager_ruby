module Commands
    class List < BaseCommand
        def initialize(params)
            @current_path = params[:current_path]
            @user_params = params[:user_params]
        end
        
        def process
            @custom_path ||= @user_params

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
            entries = Dir.entries(path).sort
            entries.each do |info|
                puts info.blue
            end
        end
    end
end