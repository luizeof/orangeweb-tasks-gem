require 'orangeweb-tasks'
require 'rails'
module OrangewebTasks
  class Railtie < Rails::Railtie
    railtie_name :orangeweb_tasks

    rake_tasks do
      load "tasks/orangeweb.rake"
      load "tasks/bower.rake"
      load "tasks/git.rake"
      load "tasks/semver.rake"
      load "tasks/webserver.rake"
    end
  end
end
