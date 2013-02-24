require "bundler/gem_tasks"

require 'rake/testtask'

namespace 'test' do
  test_files             = FileList['test/**/*_test.rb']
  integration_test_files = FileList['test/**/*_integration_test.rb']
  unit_test_files        = test_files - integration_test_files

  desc "Run unit tests"
  Rake::TestTask.new('unit') do |t|
    t.libs.push "lib"
    t.test_files = unit_test_files
    t.verbose = false
  end

  desc "Run integration tests"
  Rake::TestTask.new('integration') do |t|
    t.libs.push "lib"
    t.test_files = integration_test_files
    t.verbose = false
  end
end

#Rake::Task['test'].clear
desc "Run all tests"
task 'test' => %w[test:unit test:integration]
task 'default' => 'test'
