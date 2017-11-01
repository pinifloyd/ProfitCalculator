lock '3.10.0'

set :application, "profitcalc"

set :repo_url, "git@github.com:pinifloyd/ProfitCalculator.git"

set :deploy_to, "/home/deployer/projects/#{fetch(:application)}"

set :ssh_options, forward_agent: true

set :rbenv_ruby, '2.4.2'

set :rbenv_map_bins, %w(
  rake
  gem
  bundle
  ruby
  rails
)

set :linked_files, %w(
  config/database.yml
)

set :linked_dirs, %w(
  log
  tmp/pids
  tmp/cache
  tmp/sockets
  vendor/bundle
  public/system
  public/uploads
)
