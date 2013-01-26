#******************************************************************************
#
# Useful Set of Rake Tasks for SemVer your App
#
# Author: 	Luiz Eduardo de Oliveira Fonseca <luizeof@gmail.com>
#
# Version: 	0.1.1
#
#******************************************************************************

require 'fileutils'
require "rubygems"
require 'rake'

desc "show current version (visit http://semver.org)"
task :semver do
  sh 'clear' 
	Rake::Task['semver:show'].invoke
end


# Versionamento do Sistema
namespace :semver do


	desc "Bumps Build Version"
	task :bump do
    Rake::Task['semver:bump:build'].invoke
	end # luizeof:semver:bump

	# shows current app version
	task :show do
    Rake::Task['semver:current'].invoke
    w = File.read("semver/WORKING")
	  puts "your webapp is under version #{w}"
	end # luizeof:semver:show



	# generate current app version file
  task :current do
    Rake::Task['semver:init'].invoke
	  
	  ver = ""
    maj = File.read("semver/MAJOR").to_i
    min = File.read("semver/MINOR").to_i
    patch = File.read("semver/PATCH").to_i
    build = File.read("semver/BUILD").to_i
    rc = File.read("semver/RCANDIDATE").to_i

    if maj >= 0 then
      ver << "#{maj}"
    end

    if min >= 0 then
      ver << ".#{min}"
    end

    if patch >= 0 then
      ver << ".#{patch}"
    end

    if build > 0 then
      ver << "-build.#{build}"
    end

    if rc > 0 then
      ver << "-rc.#{rc}"
    end

    File.open("semver/WORKING", "w+") do |f|
      f.write(ver)
    end
  end # semver:current



  # init all semver files
  task :init do
    Dir.mkdir(Rails.root.join("semver/")) unless File.exists?(Rails.root.join("semver/"))
    
    unless File.exist?("semver/MAJOR") then
      File.open("semver/MAJOR", "w+") do |f|
        f.write("0")
      end
    end
	    
    unless File.exist?("semver/MINOR") then
      File.open("semver/MINOR", "w+") do |f|
        f.write("0")
      end
    end

    unless File.exist?("semver/PATCH") then
      File.open("semver/PATCH", "w+") do |f|
        f.write("0")
      end
    end

    unless File.exist?("semver/BUILD") then
      File.open("semver/BUILD", "w+") do |f|
        f.write("0")
      end
    end

    unless File.exist?("semver/RCANDIDATE") then
      File.open("semver/RCANDIDATE", "w+") do |f|
        f.write("0")
      end
    end

    unless File.exist?("semver/WORKING") then
      File.open("semver/WORKING", "w+") do |f|
        f.write("0.0.0")
      end
    end

  end # semver:init



namespace :bump do # semver:bump


  desc "Bump Major Version"
  task :major do
	
    Rake::Task['semver:init'].invoke
    
    maj = File.read("semver/MAJOR")
    maj = maj.to_i + 1
	     
    File.open("semver/MAJOR", "w+") do |f|
      f.write(maj)
    end

    File.open("semver/MINOR", "w+") do |f|
      f.write("0")
    end

    File.open("semver/PATCH", "w+") do |f|
      f.write("0")
    end

    File.open("semver/BUILD", "w+") do |f|
      f.write("0")
    end

    File.open("semver/RCANDIDATE", "w+") do |f|
      f.write("0")
    end
	
    Rake::Task['semver:show'].invoke

	end # semver:bump:major




  desc "Bump Minor Version"
  task :minor do
	
    Rake::Task['semver:init'].invoke

    min = File.read("semver/MINOR")
    min = min.to_i + 1
	     
    File.open("semver/MINOR", "w+") do |f|
      f.write(min)
    end

    File.open("semver/PATCH", "w+") do |f|
      f.write("0")
    end

    File.open("semver/BUILD", "w+") do |f|
      f.write("0")
    end

    File.open("semver/RCANDIDATE", "w+") do |f|
      f.write("0")
    end

    Rake::Task['semver:show'].invoke

	end # semver:bump:minor





  desc "Bump Patch Version"
  task :patch do

    Rake::Task['semver:init'].invoke
	
    patch = File.read("semver/PATCH")
    patch = patch.to_i + 1
	     
    File.open("semver/PATCH", "w+") do |f|
      f.write(patch)
    end

    File.open("semver/BUILD", "w+") do |f|
      f.write("0")
    end

    File.open("semver/RCANDIDATE", "w+") do |f|
      f.write("0")
    end
	
    Rake::Task['semver:show'].invoke

	end # semver:bump:patch




	desc "Bump Build Version"
	task :build do

	Rake::Task['semver:init'].invoke
	
	build = File.read("semver/BUILD")
	build = build.to_i + 1
	     
  	File.open("semver/BUILD", "w+") do |f|
    	  f.write(build)
  	end

  	File.open("semver/RCANDIDATE", "w+") do |f|
    	  f.write("0")
  	end
	
	Rake::Task['semver:show'].invoke

	end # semver:bump:build




  desc "Bump Release Candidate Version"
  task :rc do
	
    Rake::Task['semver:init'].invoke

    rc = File.read("semver/RCANDIDATE")
    rc = rc.to_i + 1
	     
    File.open("semver/RCANDIDATE", "w+") do |f|
      f.write(rc)
    end
	
	  Rake::Task['semver:show'].invoke

	end # semver:bump:rc


end # semver:bump

end # semver
