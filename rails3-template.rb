say <<-EOS
  ====== rails3-template ======
  Author: PeterWong (http://peterwongpp.com)
  
  This template is going to install these things for you:
    - rvm supporting (.rvmrc)
    - haml
    - haml-rails
    - kaminari
    - simple_form
    - compass
    - jquery-rails
    - forgery
    - factory_girl_rails
    - rspec_rails
    - autotest
EOS

create_file '.rvmrc', 'rvm gemset use #{app_name}'

run 'rm README'
run 'rm public/index.html'
run 'rm public/images/rails.png'
run 'rm public/javascripts/controls.js'
run 'rm public/javascripts/dragdrop.js'
run 'rm public/javascripts/effects.js'
run 'rm public/javascripts/prototype.js'
run 'rm public/javascripts/rails.js'

gem 'haml'
gem 'haml-rails'
gem 'kaminari'
gem 'simple_form'
gem 'compass'
gem 'jquery-rails'

gem 'forgery', :group => [:test, :development]
gem 'factory_girl_rails', :group => [:test, :development]
gem 'rspec-rails', :group => [:test, :development], :version => '~> 2.4'
gem 'autotest', :group => [:test, :development]

run 'bundle install'

generate 'kaminari:views default'
generate 'simple_form:install'
generate 'jquery:install'
generate 'rspec:install'

run 'compass init rails . --using blueprint/semantic -x sass'
say <<-EOS
  You may reference to this document for setting up compass on heroku:
    http://devcenter.heroku.com/articles/using-compass
EOS

generate :controller, 'pages'
route "root :to => 'pages#index'"

git :init
git :add => '.'
git :commit => '-am "first commit"'