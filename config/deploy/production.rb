server 'XXX.XXX.XXX.XXX', user: 'deployer', roles: %w{web app db}

set :rails_env, :production

set :branch, ENV['BRANCH'] || 'master'
