require 'erb'
require 'capybara/cucumber'
require 'capybara/mechanize/cucumber'
require 'rspec'

Before do
  @test_files_dir = File.join(Dir.pwd, "test_files")
  FileUtils.rm_r(@test_files_dir) if File.exists?(@test_files_dir)
  FileUtils.mkdir_p(@test_files_dir)
end