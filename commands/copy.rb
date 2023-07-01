require_relative './utils'

module Commands
  class Copy < BaseCommand
    include Commands::Utils

    def initialize(params)
      @user_params = params.dig(:user_params)
      @current_path = params.dig(:current_path)
    end

    def process
      origin = @user_params[0]
      destination = @user_params[1]

      definitive_origin = is_a_path?(origin) ? origin : "#{@current_path}/#{origin}"
      definitive_destination = is_a_path?(destination) ? destination : "#{@current_path}/#{destination}"

      begin
        FileUtils.cp(definitive_origin, definitive_destination)
      rescue Errno::EISDIR
        FileUtils.cp_r(definitive_origin, definitive_destination)
      end

      p definitive_destination
    end

    def self.description
      puts "cp <file or arquive> <path destination>"
    end
  end
end