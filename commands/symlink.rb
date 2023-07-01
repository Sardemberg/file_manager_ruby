require_relative './utils'

module Commands
  class Symlink < BaseCommand
    include Commands::Utils

    def initialize(params)
      @current_path = params[:current_path]
      @user_params = params[:user_params]
    end

    def process
      file_path = format_path(@current_path, @user_params.first)
      shortcut_link = format_path(@current_path, @user_params.last)

      return puts "File not found".red unless check_presence(file_path)

      File.symlink(file_path, shortcut_link)

      puts "Sucesso!".green
    end

    def self.description
      "ln <file_path> <symlink_path>"
    end
  end
end