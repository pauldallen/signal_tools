Gem::Specification.new do |gem|
  gem.name    = 'yquotes_signal_tools'
  gem.version = '0.1.0'
  gem.date    = Date.today.to_s

  gem.summary = "Create technical analysis data for a given stock."
  gem.description = "Gem to create technical analysis data for a given stock (like MACD, stochastic, and exponential moving averages)."

  gem.authors  = ['Matt White', 'Paul Allen']
  gem.email    = 'pauldallen@gmail.com'
  gem.homepage = 'http://git@github.com/pauldallen/signal_tools'
  gem.files    = Dir['Rakefile', '{lib,spec}/**/*', 'README*', 'LICENSE*'] & `git ls-files -z`.split("\0")
  gem.license  = 'MIT'

  gem.add_dependency('yquotes', '~> 2.1.0')
  gem.add_development_dependency('rspec', '~> 3.7.0')
end
