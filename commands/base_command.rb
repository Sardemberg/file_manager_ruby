module Commands
    class BaseCommand
        def process
            raise NotImplementedError.new("This method shold be implemented in your concrete classes")
        end


        def self.description
            raise NotImplementedError.new("This method shold be implemented in your concrete classes")
        end
    end
end