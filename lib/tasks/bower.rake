# -*- encoding : utf-8 -*-
#******************************************************************************
#
# Useful Set of Rake Tasks for Manage Twitter Bower.
#
# Author: 	Luiz Eduardo de Oliveira Fonseca <luizeof@gmail.com>
#
# Version: 	0.1.1
#
#******************************************************************************

# Bower Assets Manager
namespace :bower do # project:bower

	  desc "install bower packages"
	  task :install do
	      sh 'bower install'
	  end

	  desc "update bower packages"
	  task :update do
	      sh 'bower update'
	  end

end