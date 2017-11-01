namespace :unicorn do
  desc "Start"
  task :start do
    on roles(:app), in: :sequence, wait: 1 do
      sudo "start profitcalc"
    end
  end

  desc "Stop"
  task :stop do
    on roles(:app), in: :sequence, wait: 1 do
      sudo "stop profitcalc"
    end
  end

  desc "Soft Restart"
  task :restart do
    on roles(:app), in: :sequence, wait: 1 do
      # execute 'kill -USR2 `cat /home/deployer/projects/profitcalc/current/tmp/pids/unicorn.pid`'
      execute "kill -HUP `cat /home/deployer/projects/profitcalc/current/tmp/pids/unicorn.pid`"
    end
  end

  desc "Hard Reboot"
  task :reboot do
    on roles(:app), in: :sequence, wait: 1 do
      sudo "stop profitcalc"
      sudo "start profitcalc"
    end
  end
end
