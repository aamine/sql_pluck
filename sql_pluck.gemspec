Gem::Specification.new do |s|
  s.platform = Gem::Platform::RUBY
  s.name = 'sql_pluck'
  s.version = '2.0.0'
  s.summary = 'Provide #pluck_by_sql for Rails ActiveRecord models'
  s.license = 'MIT'

  s.author = ['Minero Aoki']
  s.email = 'aamine@loveruby.net'
  s.homepage = 'https://github.com/aamine/sql_pluck'

  s.files = `git ls-files -z`.split("\x0").reject {|f| f.match(%r{^(test|spec|features)/}) }
  s.require_path = 'lib'

  s.add_dependency 'activerecord', '~> 5.0'
end
