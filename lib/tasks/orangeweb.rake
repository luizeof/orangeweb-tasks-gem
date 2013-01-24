# -*- encoding : utf-8 -*-
#******************************************************************************
#
# Useful Set of Rake Tasks for Ruby on Rails Development.
#
# Author: 	Luiz Eduardo de Oliveira Fonseca <luizeof@gmail.com>
#
# Version: 	0.1.1
#
#******************************************************************************


require 'fileutils'
require "rubygems"
require 'rake'
require 'yaml'
require 'time'


task :deploy do
  Rake::Task['project:about'].invoke
end


namespace :project do


  # Show Help & Usage for luizeof Rake Tasks
  desc "Show Help & Usage for Orangeweb Rake Tasks"
  task :about do
    puts <<-about

      Useful Rake Tasks for Rails Development.
      Author: Luiz Eduardo de Oliveira Fonseca < luizeof@gmail.com >
      Version: 0.1.1 (23/01/2013)

    about
  end



  # Run Gems / Bundler Tasks
  desc "Run Gems / Bundler Tasks"
  task :gems do
    sh 'gem update'
    sh 'bundle install'
    sh 'bundle update'
  end




  # Execute All Deploy Tasks on Server
  desc "Execute All Tasks to Deploy your App on Server"
  task :deploy do
    Rake::Task['webserver:nginx:stop'].invoke
    Rake::Task['project:gems'].invoke
    Rake::Task['assets:clean'].invoke
    Rake::Task['assets:precompile'].invoke
    Rake::Task['db:migrate RAILS_ENV=production'].invoke
    Rake::Task['log:clear'].invoke
    Rake::Task['webserver:nginx:start'].invoke
    puts "all deploy tasks done..."
 end


end # project