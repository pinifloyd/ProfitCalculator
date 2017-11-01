namespace :database do

  desc "Create database"
  task :create do
    on roles(:app), in: :sequence, wait: 1 do
      within release_path do
        execute "bundle", "exec rake db:create RAILS_ENV=#{fetch(:rails_env)}"
      end
    end
  end

  desc "Drop database"
  task :drop do
    on roles(:app), in: :sequence, wait: 1 do
      within release_path do
        execute "bundle", "exec rake db:environment:set RAILS_ENV=#{fetch(:rails_env)}"
        execute "bundle", "exec rake db:drop RAILS_ENV=#{fetch(:rails_env)} DISABLE_DATABASE_ENVIRONMENT_CHECK=1"
      end
    end
  end

  desc "Seed database"
  task :seed do
    on roles(:app), in: :sequence, wait: 1 do
      within release_path do
        execute "bundle", "exec rake db:seed RAILS_ENV=#{fetch(:rails_env)}"
      end
    end
  end

  desc "Setup database"
  task :setup do
    on roles(:app), in: :sequence, wait: 1 do
      within release_path do
        execute "bundle", "exec rake db:setup RAILS_ENV=#{fetch(:rails_env)}"
      end
    end
  end

end
