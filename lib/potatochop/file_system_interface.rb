module Potatochop
  class FileSystemInterface
    attr_reader :source

    def initialize(source, options = {})
      @source = source
    end
    
    def exists?(file_name)
      file_path = File.join(@source, file_name)
      File.exists? file_path
    end
    
    def read(file_name)
      file_path = File.join(@source, file_name)
      File.read(file_path)
    end
  end
end