require_relative './base_command'

module Commands
    class Copy < BaseCommand
        def process(params)
        end


        def self.description
            puts "cp <file or arquive> <path destination>"
        end
    end
end