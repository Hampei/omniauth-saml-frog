require File.expand_path('../lib/omniauth-saml-frog/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = 'omniauth-saml-frog'
  gem.version       = OmniAuth::SAMLFrog::VERSION
  gem.summary       = 'A custom info auth hash translating the frogeducation.com attributes to something sensible. Subclass of omniauth-saml.'
  gem.description   = 'A frogeducation.com SAML strategy for OmniAuth.'
  gem.license       = 'MIT'

  gem.authors       = ['Henk van der Veen']
  gem.email         = 'henk.van.der.veen@gmail.com'
  gem.homepage      = 'https://github.com/hampei/omniauth-saml-frog'

  gem.add_runtime_dependency 'omniauth-saml', '~> 1.1'

  gem.files         = ['README.md', 'CHANGELOG.md'] + Dir['lib/**/*.rb']
  gem.require_paths = ["lib"]
end
