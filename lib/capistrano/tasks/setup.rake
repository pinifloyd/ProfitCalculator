namespace :config do
  desc "Copy nginx.conf"
  task :copy_nginx do
    on roles(:app), in: :sequence, wait: 1 do
      sudo "cp /home/deployer/projects/profitcalc/current/config/servers/nginx.conf /etc/nginx/"
    end
  end

  desc "Copy nginx.profitcalc.conf"
  task :copy_nginx_profitcalc do
    on roles(:app), in: :sequence, wait: 1 do
      sudo "rm -rf /etc/nginx/sites-available/*"
      sudo "rm -rf /etc/nginx/sites-enabled/*"
      sudo "cp /home/deployer/projects/profitcalc/current/config/servers/nginx.profitcalc.conf /etc/nginx/sites-available/profitcalc.conf"
      sudo "ln -s /etc/nginx/sites-available/profitcalc.conf /etc/nginx/sites-enabled/profitcalc.conf"
    end
  end

  desc "Copy unicorn.env.conf"
  task :copy_unicorn do
    on roles(:app), in: :sequence, wait: 1 do
      sudo "cp /home/deployer/projects/profitcalc/current/config/servers/unicorn.#{fetch(:rails_env)}.conf /etc/init/profitcalc.conf"
    end
  end

  desc "Copy all scripts"
  task :copy do
    invoke "config:copy_nginx"
    invoke "config:copy_nginx_profitcalc"
    invoke "config:copy_unicorn"
  end
end
