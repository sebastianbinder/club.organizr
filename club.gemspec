$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "club/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "club"
  s.version     = Club::VERSION
  s.authors     = [""]
  s.email       = [""]
  s.homepage    = ""
  s.summary     = ""
  s.description = ""
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.1.4"
  s.add_dependency "tinymce-rails"
  s.add_dependency "tinymce-rails-langs"
  s.add_dependency "kaminari"
  s.add_dependency "bootstrap-sass"
  s.add_dependency "slim-rails"

  s.add_development_dependency "sqlite3"
end
