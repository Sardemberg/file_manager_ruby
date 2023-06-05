require 'bundler/setup'

# Load command modules
Dir["./commands/*.rb"].each { |file| require_relative file }

# Load all gems
Bundler.require

# Initial work path
current_path = '/home/sardemberg'

# Normalize params method
def normalize_params(prompt)
    values = prompt.split(" ")
    command = values[0]
    values.delete(command)

    return [command, values.first] if values.size < 2

    [command, values]
end

while true do
    user_prompt = gets.chomp

    command, params = normalize_params(user_prompt)

    #TODO: Refator legibity of this
    dict_commands = {
        :cp => Commands::Copy,
        :help => Commands::Help,
        :ls => Commands::List,
        :cd => Commands::Open,
        :mkdir => Commands::Mkdir,
        :rm => Commands::Remove
    }

    final_command = dict_commands[command.to_sym]

    #TODO: Refactor this
    if final_command
      params = {
        :user_params => params || nil,
        :current_path => current_path
      }

      if final_command == Commands::Open
        current_path = final_command.new(params).process
        next
      end

      final_command.new(params).process
    else
        puts "Error: This method does not exists in our file manager"
    end
end