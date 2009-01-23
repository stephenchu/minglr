class InputCache
  class << self
    def put(key, content)
      File.open(file_pathname(key), File::CREAT | File::WRONLY | File::TRUNC) { |file| file.write content }
    end
  
    def get(key)
      if content = File.read(file_pathname(key))
        return nil if content.blank?
        content
      end
    rescue
      nil
    end
  
    protected
  
    def file_pathname(key)
      File.join(Dir::tmpdir, "#{key.to_s.gsub(/[^\w]/, '')}.entry")
    end
  end
end
