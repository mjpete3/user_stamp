#     This file is part of the UserStamp library that provides tools to
#     track who created, updated, or destroyed a record in the database.
#
#     https://github.com/mjpete3/user_stamp
#     
#     Copyright (C) 2015 PD Technology Solutions, LLC
#
#     Permission is hereby granted, free of charge, to any person obtaining
#     a copy of this software and associated documentation files (the
#     "Software"), to deal in the Software without restriction, including
#     without limitation the rights to use, copy, modify, merge, publish,
#     distribute, sublicense, and/or sell copies of the Software, and to
#     permit persons to whom the Software is furnished to do so, subject to
#     the following conditions:
#
#     The above copyright notice and this permission notice shall be
#     included in all copies or substantial portions of the Software.
#
#     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
#     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
#     MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
#     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
#     LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
#     OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
#     WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "user_stamp/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "user_stamp"
  s.version     = UserStamp::VERSION
  s.authors     = ["Marty Petersen"]
  s.email       = ["marty.petersen@pd-techsolutions.com"]  
  s.summary     = "Provides the ability to stamp database records with the user name when creating, updating or destroying"

  descript      = "Preserve the user identity when database records are updated for tracking or audit purposes. "   
  descript     += "The gem uses the current_user object from Devise.  Users are required to be authenticated to the application."
  descript     += "For RAILS 3.2.x use gem version 3.x,  For RAILS 4.x.x use gem version 4.x"
  s.description = descript

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.21"
  s.add_dependency "devise"
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
end
