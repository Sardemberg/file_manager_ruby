require_relative './utils'

module Commands
  class Permission < BaseCommand
    include Commands::Utils

    PERMISSIONS = {
      'read' => 0400,
      'write' => 0200,
      'all' => 0100
    }

    def initialize(params)
      @user_params = params[:user_params]
      @current_path = params[:current_path]
    end

    def self.description
      "chmod [-f] <file_or_dir> <type_of_permission>"
    end

    def process
      path = format_path(@current_path, @user_params.first)

      if @user_params.first == "-f"
        return puts "File not found" unless check_presence(path)

        File.chmod(PERMISSIONS[@user_params.last], path)
        puts "Success!".green

        return
      end

      return puts "Folder not found".red unless check_presence(path)

      File.chmod(PERMISSIONS[@user_params.last], path)
      puts "Success!".green
    end
  end
end