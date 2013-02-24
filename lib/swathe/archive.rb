module Swathe
  class Archive
    attr_accessor :file_name

    def self.open(file_name)
      case File.extname(file_name)
      when 'gz'
        Gzip.open(file_name)
      when 'tar'
        Tar.open(file_name)
      when 'zip'
        Zip.open(file_name)
      end
    end

    def tar?
      false
    end

    def gz?
      false
    end

    def zip?
      false
    end

    def extractor(default_destination = nil)
      Extractor.new(self, default_destination)
    end

  end
end