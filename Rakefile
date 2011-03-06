require 'bundler'
require 'cucumber/rake/task'

Bundler::GemHelper.install_tasks
Cucumber::Rake::Task.new

task :default do
  versions = nil

  cd('features/support/public') do
   versions = Dir['jquery/*.js'].product(Dir['jquery-ui/*.js'])
  end

  versions.each do |jquery, jquery_ui|
    ln_s jquery,    'features/support/public/jquery.js',    :force => true
    ln_s jquery_ui, 'features/support/public/jquery-ui.js', :force => true
    ln_s jquery_ui.sub('.js', '.css'), 'features/support/public/jquery-ui.css', :force => true
    task(:cucumber).execute
  end
end
