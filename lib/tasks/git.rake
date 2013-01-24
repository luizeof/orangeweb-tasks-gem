# -*- encoding : utf-8 -*-
#******************************************************************************
#
# Useful Set of Rake Tasks for Git Management.
#
# Author: 	Luiz Eduardo de Oliveira Fonseca <luizeof@gmail.com>
#
# Version: 	0.1.1
#
#******************************************************************************


desc "Show info about current repo state"
task :git do
   sh "clear"
   sh "git branch"
   sh "git tag"
   sh "git status"
end


# Git
namespace :git do

  # show 
  task :tag do
    Rake::Task['git:tag:show'].invoke
  end # show

# Git Tag
namespace :tag do
  	  
  desc "Tag last Commit with a auto increment number prefix"
  task :create do
    tag = File.read("semver/WORKING")
    sh "git tag -a #{tag} -m #{tag}"
  end # git:tag:create


  desc "Show last tag details"
  task :show do
    tag = File.read("semver/WORKING")
    puts "show info about tag #{tag}"
    sh = "git show #{tag}"
	end # git:tag:show

end # git:tag

end # git