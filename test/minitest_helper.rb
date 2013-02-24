require 'rubygems'
gem 'minitest' # ensures you're using the gem, and not the built in MT
require 'minitest/autorun'
require 'minitest/unit'
require 'minitest/mock'

require 'swathe'

def samples_path
  "#{Swathe.project_root}/samples"
end