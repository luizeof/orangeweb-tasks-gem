orangeweb-tasks-gem
===================

Rake Tasks que utilizamos para auxiliar o desenvolvimento de Aplicações em Ruby on Rails.

For Help with SemVer, please go to [Using SemVer Tasks](https://github.com/orangeweb/orangeweb-tasks-gem/wiki/Using-SemVer-Tasks) manual.


## Installing Gem

Just run on your terminal ```gem install orangeweb-tasks```

and … add to your GemFile


```gem "orangeweb-tasks"```

done.

## Rake Tasks


#### Twitter Bower

```
rake bower:install                     # install bower packages
rake bower:update                      # update bower packages
```

#### Git


```
rake git                               # show info about current repo state
rake git:push                          # push all repo, commits, branchs and tags
rake git:tag                           # tag last Commit with current semver version
rake git:tag:show                      # show last tag details
```

#### Rails Project

```
rake project:about                     # Show Help & Usage for Orangeweb Rake Tasks
rake project:deploy                    # Execute All Tasks to Deploy your App on Server
rake project:gems                      # Run Gems / Bundler Tasks
```

#### SemVer Versioning

```
rake semver                            # show current version (visit http://semver.org)
rake semver:bump                       # Bump Build Version
rake semver:bump:build                 # Bump Build Version
rake semver:bump:major                 # Bump Major Version
rake semver:bump:minor                 # Bump Minor Version
rake semver:bump:patch                 # Bump Patch Version
rake semver:bump:rc                    # Bump Release Candidate Version
```

#### Deploy Server

```
rake webserver:nginx:restart           # restart nginx service ( as sudo )
rake webserver:nginx:start             # start nginx service ( as sudo )
rake webserver:nginx:stop              # stop nginx service ( as sudo )
```
