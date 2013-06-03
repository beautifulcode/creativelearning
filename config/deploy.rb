# require 'deprec'

set :domain, '198.199.104.225'
set :application, "creativelearning.ca"
set :user, 'deploy'
set :use_sudo, false

set :scm, :git
set :repository,  "git@github.com:beautifulcode/creativelearning.git"

set :deploy_to, "/var/www/apps/#{application}"

role :app, domain
role :web, domain
role :db,  domain, :primary => true


namespace :deploy do
  desc "Restarting mod_rails with restart.txt"
  task :start, :roles => :app, :except => { :no_release => true } do
    run "passenger start --socket /tmp/#{application}.socket -d -e production"
  end

  task :stop, :roles => :app, :except => { :no_release => true } do
    run "passenger stop"
  end

  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{current_path}/tmp/restart.txt"
  end

end

task :after_symlink, :roles => [:app, :web] do
   run "ln -nfs #{shared_path}/sponsor #{current_path}/public/sponsor"
   run "ln -nfs #{shared_path}/result #{current_path}/public/result"
   run "ln -nfs #{shared_path}/schedule #{current_path}/public/schedule"
   run "chmod 777 #{current_path}/tmp/"
   run "chmod 777 #{current_path}/tmp/*"
 end
