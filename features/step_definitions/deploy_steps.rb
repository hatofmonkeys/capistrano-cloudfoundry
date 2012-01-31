def write_template(file)
  template_path     = File.expand_path(File.join(__FILE__, "..", "..", "templates", "#{file}.erb"))
  compiled_template = ERB.new(File.read(template_path)).result(binding)

  File.open(File.join(@test_files_dir, file), 'w') {|f|
    f.write compiled_template
  }
end

Given /^a test application$/ do

  Dir.chdir(@test_files_dir) do
    system "capify ."
  end

  FileUtils.mkdir_p("#{@test_files_dir}/config/deploy")
  %w{config/deploy.rb config/deploy/staging.rb config/deploy/production.rb Capfile}.each do |file|
    write_template file
  end

end

Given /^no test application deployed$/ do
  Dir.chdir(@test_files_dir) do
    system "cap cloudfoundry:login"
  end
  apps = `vmc apps`
  if apps.include?(" " + CF_APP + "-blue ") then
    `vmc delete #{CF_APP}-blue`
  end
  if apps.include?(" " + CF_APP + "-green ") then
    `vmc delete #{CF_APP}-green`
  end
end

When /^I deploy a (\w*)[ ]?version (\d+) test application$/ do |arg1,arg2|
  @version = arg2
  @broken = arg1
  write_template "env.rb"
  Dir.chdir(@test_files_dir) do
    system "cap cloudfoundry"
  end
end

When /^I visit the test application home page$/ do
  visit(CF_URL)
end

Then /^I expect to see "([^"]*)"$/ do |arg1|
  page.should have_content(arg1)
end

Given /^a deployed test application$/ do
  steps %Q{
    Given no test application deployed
    And I deploy a version 1 test application
  }
end