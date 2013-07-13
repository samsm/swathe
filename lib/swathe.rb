require_relative "swathe/version"
require_relative "swathe/archive"
require_relative "swathe/extractor"
require_relative "swathe/tar"
require_relative "swathe/gzip"
require_relative "swathe/zip"


module Swathe
  def self.root
    File.dirname(__FILE__)
  end

  def self.project_root
    File.expand_path(File.join(root, '..'))
  end
end
