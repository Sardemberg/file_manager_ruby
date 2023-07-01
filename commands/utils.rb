module Commands
    module Utils
        def check_dir(path, dir_name)
            Dir.entries(path).each do |directory|
                return true if directory == dir_name
            end

            false
        end

        def is_a_path?(string)
            return true if string.split("/").count >= 2

            false
        end

        def format_path(current_path, file_name)
            return file_name if is_a_path?(file_name)

            "#{current_path}/#{file_name}"
        end

        def check_presence(path)
            file = File.basename(path)
            dir = File.dirname(path)

            check_dir(dir, file)
        end
    end
end