$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "simple_datatable/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "simple_datatable"
  s.version     = SimpleDatatable::VERSION
  s.authors     = ["An Cao"]
  s.email       = ["ancv.it@gmail.com"]
  s.homepage    = "https://github.com/Ruby-SG/simple_datatable/"
  s.summary     = "Simple manage admin with datatable"
  s.description = "Add datatable"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 4.0.0"
  s.add_dependency "rspec-rails", '~> 3.0'
  s.add_dependency "factory_girl_rails", '~> 4.5.0'
end
