namespace :nginx do
  desc "Nginx Start"
  task :start do
    on roles(:app), in: :sequence, wait: 1 do
      sudo "service nginx start"
    end
  end

  desc "Nginx Stop"
  task :stop do
    on roles(:app), in: :sequence, wait: 1 do
      sudo "service nginx stop"
    end
  end

  desc "Nginx Restart"
  task :restart do
    on roles(:app), in: :sequence, wait: 1 do
      sudo "service nginx restart"
    end
  end
end
