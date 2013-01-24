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

namespace :webserver do



  namespace :nginx do # nginx



	    desc "start nginx service ( as sudo )"
	    task :start do
	        sh 'sudo service nginx start'
	    end



	    desc "stop nginx service ( as sudo )"
	    task :stop do
	        sh 'sudo service nginx stop'
	    end



	    desc "restart nginx service ( as sudo )"
	    task :restart do
	        sh 'sudo service nginx restart'
	    end
	  
	  
	  
  end # server:nginx



end # server