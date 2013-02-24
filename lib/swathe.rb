require "swathe/version"
require "swathe/archive"
require "swathe/tar"
require "swathe/gzip"
require "swathe/zip"


module Swathe
  def self.root
    File.dirname(__FILE__)
  end

  def self.project_root
    File.expand_path(File.join(root, '..'))
  end
end
