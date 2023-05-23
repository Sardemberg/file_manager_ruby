require_relative './commands/copy'
require_relative './commands/help'
INITIAL_PATH = '/home/aluno'

while true do
    user_prompt = gets.chomp
    command, params = user_prompt.split(" ")

    dict_commands = {
        :cp => Commands::Copy.new,
        :help => Commands::Help.new,
        :ls => Commands::List.new(:current_path => INITIAL_PATH, :custom_path => params)
    }

    final_command = dict_commands[command.to_sym]

    if final_command
        final_command.process
    else
        puts "Error: This method not exists in our file manager"
    end
end