require 'colorize'
require_relative './base_command'
require_relative './copy'
require_relative './list'

module Commands
    class Help < BaseCommand
        def process
            command_classes = [Copy, List]
            puts "This system provides a simple file manager linux based. How list commands:".yellow
            
            command_classes.each do |command_class|
                command_class.description
            end
        end
    end
end