namespace :deploy do

  # Main deploy
  #----------------------------------------------------------------------------
  desc "Deploy To Server(s)"
  task :start do
    after "deploy:publishing", "config:copy"
    after "deploy:publishing", "nginx:restart"
    after "deploy:publishing", "unicorn:restart"

    invoke "deploy"
  end

  # Init new server
  #----------------------------------------------------------------------------
  desc "Init New Server(s)"
  task :init do
    before "deploy:migrate", "database:create"

    after "deploy:publishing", "config:copy"
    after "deploy:publishing", "nginx:restart"
    after "deploy:publishing", "unicorn:start"
    after "deploy:publishing", "database:seed"

    invoke "deploy"
  end

  # ReInit server
  #----------------------------------------------------------------------------
  desc "ReInit Server(s)"
  task :reinit do
    before "deploy:migrate", "nginx:stop"
    before "deploy:migrate", "unicorn:stop"
    before "deploy:migrate", "database:drop"
    before "deploy:migrate", "database:create"

    after "deploy:publishing", "config:copy"
    after "deploy:publishing", "nginx:start"
    after "deploy:publishing", "unicorn:start"
    after "deploy:publishing", "database:seed"

    invoke "deploy"
  end

end
