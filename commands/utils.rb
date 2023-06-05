module Commands
    module Utils
        def check_dir(path, dir_name)
            Dir.entries(path).each do |directory|
                return true if directory == dir_name
            end

            false
        end
    end
end