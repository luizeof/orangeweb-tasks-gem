orangeweb-tasks-gem
===================

Rake Tasks que utilizamos para auxiliar o desenvolvimento de Aplicações em Ruby on Rails.

#### Twitter Bower

```shell
rake bower:install            # install bower packages
rake bower:update             # update bower packages
```

#### Git


```
rake git                      # Show info about current repo state
rake git:tag:create           # Tag last Commit with a auto increment number prefix
rake git:tag:show             # Show last tag details
```

#### Rails Project

```
rake project:about            # Show Help & Usage for Orangeweb Rake Tasks
rake project:deploy           # Execute All Tasks to Deploy your App on Server
rake project:gems             # Run Gems / Bundler Tasks
```

#### SemVer Versioning

```
rake semver                   # show current version (visit http://semver.org)
rake semver:bump:build        # Bump Build Version
rake semver:bump:major        # Bump Major Version
rake semver:bump:minor        # Bump Minor Version
rake semver:bump:patch        # Bump Patch Version
rake semver:bump:rc           # Bump Release Candidate Version
```

#### Deploy Server

```
rake webserver:nginx:restart  # restart nginx service ( as sudo )
rake webserver:nginx:start    # start nginx service ( as sudo )
rake webserver:nginx:stop     # stop nginx service ( as sudo )
```
