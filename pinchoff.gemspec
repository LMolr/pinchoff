require File.expand_path('../lib/pinchoff/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = 'pinchoff'
  gem.version       = Pinchoff::VERSION
  gem.summary       = %q{Throttle the execution of an operation.}
  gem.description   = %q{
    Simple utility to throttle the execution of an operation (e.g. reconnect too fast).
  }
  gem.license       = 'GPLv2'
  gem.authors       = ['Luca Molari']
  gem.email         = 'molari.luca@gmail.com'
  gem.homepage      = 'https://github.com/LMolr/pinchoff'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^spec/})
  gem.require_paths = ['lib']

  gem.add_dependency             'semaphore',  '~> 0.0.1'

  gem.add_development_dependency 'bundler',    '~> 1.7'
  gem.add_development_dependency 'rake',       '~> 10.3'
  gem.add_development_dependency 'yard',       '~> 0.8'
  gem.add_development_dependency 'rspec',      '~> 3.1'
  gem.add_development_dependency 'pry',        '~> 0.10'
  gem.add_development_dependency 'pry-byebug', '~> 2.0'
  gem.add_development_dependency 'kramdown',   '~> 1.5'

end
