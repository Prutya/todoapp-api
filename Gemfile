ruby '2.5.0'

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'bcrypt',    '~> 3.1.11'
gem 'jbuilder',  '~> 2.7.0'
gem 'kaminari',  '~> 1.1.1'
gem 'pg',        '>= 0.18', '< 2.0'
gem 'puma',      '~> 3.7'
gem 'rack-cors', '~> 1.0.2'
gem 'rails',     '~> 5.1.5'

group :development, :test do
  gem 'byebug'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
