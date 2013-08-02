require File.expand_path('../lib/omniauth-atech/version', __FILE__)

Gem::Specification.new do |s|
  s.name          = "omniauth-atech"
  s.description   = %q{OmniAuth strategy for aTech Media}
  s.summary       = s.description
  s.homepage      = "https://github.com/atech/omniauth-atech"
  s.version       = OmniAuth::Atech::VERSION

  s.files         = Dir.glob("{lib}/**/*")
  s.require_paths = ["lib"]

  s.add_dependency 'omniauth', '~> 1.0'
  s.add_dependency 'omniauth-oauth2', '~> 1.1'
  
  s.authors       = ["Adam Cooke"]
  s.email         = ["adam@atechmedia.com"]
end
