require 'rake'
require 'rake/testtask'

task :default => [:tests]

desc "Run basic tests"
Rake::TestTask.new("tests") { |t|
  t.test_files = FileList['test/case/*.rb']
  t.verbose = false
  t.warning = false
}
