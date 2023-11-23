# frozen_string_literal: true


require "bundler/gem_tasks"
require "rake/testtask"


LIB_PATH = "./lib/functional_shell_commands"
Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList["test/**/test_*.rb"]
end

task default: :test

task :generate do
  preprocess
  create_files
  add_shebang
  add_permission
  clean_up
end
  
def preprocess
  Dir.glob("#{LIB_PATH}/*.y").each do |file|
    text = File.read(file)
    # replace include tag to token rule file 
    text.gsub!(/#include ([a-z_].+[token|rule])/) do |match|
      match_str = Regexp.last_match(1)
      raise "include file no found #{match}" unless File.exist?(LIB_PATH + "/" + match_str)
      File.read(LIB_PATH + "/" + match_str)
    end
    # .racc files is the intermediate file that should be compiled by racc.
    target_file_name = file.gsub(".y", ".racc")
    File.write(target_file_name, text)
  end
end

def create_files
  Dir.glob("#{LIB_PATH}/*.racc") do |file|
    without_extension = file.gsub(".racc","")
    temp_name = without_extension.split('/')
    target_file_name = "fsc_" + temp_name.last
    target_file = "./bin/#{target_file_name}"
    sh "racc -o #{target_file} #{file}"
  end
end

def add_shebang
  Dir.glob("./bin/*") do |file_name|
    original_content = File.read(file_name)

    File.open(file_name, "w") do |file|
      file.puts "#!/usr/bin/env ruby"
      file.puts original_content       
    end
  end
end
  
def add_permission
  Dir.glob("./bin/*") do |file|
    sh "chmod +x #{file}"
  end
end

def clean_up
  Dir.glob("#{LIB_PATH}/*.racc") do |file|
    File.delete(file)
  end
end
