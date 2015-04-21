$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "spree_mercado_pago/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "spree_mercado_pago"
  s.version     = SpreeMercadoPago::VERSION
  s.authors     = [""]
  s.email       = [""]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of SpreeMercadoPago."
  s.description = "TODO: Description of SpreeMercadoPago."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.0"

  s.add_development_dependency "sqlite3"
end
