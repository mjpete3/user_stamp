$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "user_stamp/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "user_stamp"
  s.version     = UserStamp::VERSION
  s.authors     = ["Marty Petersen"]
  s.email       = ["marty.petersen@pd-techsolutions.com"]  
  s.summary     = "Provides the ability to stamp datbase records with the user name when saving, updating or destorying"
  s.description = "Preserve the user idenity whwn database records are updated for tracking or audit purposes."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.21"
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
end
