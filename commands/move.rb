require_relative './utils'

module Commands
  class Move < BaseCommand
    include Commands::Utils

    def initialize(params = {})
      @user_params = params[:user_params]
      @current_path = params[:current_path]
    end

    def process
      user_path = @user_params.first
      destination_path = @user_params.last

      final_user_path = is_a_path?(user_path) ? user_path : "#{@current_path}/#{user_path}"
      final_destination_path = is_a_path?(destination_path) ? destination_path : "#{@current_path}/#{destination_path}"

      FileUtils.mv(final_user_path, final_destination_path)

      puts "Sucesso!".green
    end

    def self.description
      "mv <file> <directory>"
    end
  end
end