ssh_options[:forward_agent] = true
default_run_options[:pty] = true
set :bundle_cmd, "LANG='en_US.UTF-8' LC_ALL='en_US.UTF-8' bundle"
set :application, ENV['APP_NAME']
set :deploy_via, :remote_cache
set :copy_exclude, ["*.psd"]
set :repository,  ENV['REPOSITORY_URL']
set :user, ENV['SSH_USER']
set :scm_verbose, true
set :scm, :git
set :use_sudo, false

#deployment settings
set :current_dir, "current"
set :deploy_to, "/usr/share/nginx/ruby/apps/#{ENV['APP_NAME_SPACE']}"
set :site_root, "/usr/share/nginx/ruby/apps/#{ENV['APP_NAME_SPACE']}/#{current_dir}"
set :keep_releases, 3


server ENV['IP_ADDRESS'], :app, :web, :db, :primary => true

task :check_revision do
  run "cat #{site_root}/REVISION"
end


after "deploy:create_symlink", "deploy:update_crontab"

namespace :deploy do
  
  task :finalize_update do
    transaction do
      run "cd #{release_path}; RAILS_ENV=production bundle install", :only => { :primary => true }
      run "cd #{release_path}; RAILS_ENV=production bundle exec rake db:migrate", :only => { :primary => true }
      run "cd #{release_path}; bundle exec rake assets:precompile RAILS_ENV=production"
    end
  end
  task :update_crontab, :roles => [:app, :web] do  
    #run "cd #{release_path} && whenever --update-crontab #{application}"  
  end  
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app do
    run "mkdir -p /usr/share/nginx/ruby/apps/#{ENV['APP_NAME_SPACE']}/#{current_dir}/tmp"
    run "sudo chmod 775 -R /usr/share/nginx/ruby/apps/#{ENV['APP_NAME_SPACE']}/#{current_dir}/tmp; true"
    run "sudo chmod 775 -R /usr/share/nginx/ruby/apps/#{ENV['APP_NAME_SPACE']}/#{current_dir}/public/assets; true"
    run "touch #{File.join("/usr/share/nginx/ruby/apps/#{ENV['APP_NAME_SPACE']}/#{current_dir}/tmp",'restart.txt')}"
  end
end