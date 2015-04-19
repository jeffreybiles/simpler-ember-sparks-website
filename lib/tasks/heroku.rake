namespace :heroku do
  desc 'backup and download heroku database'
  task :backup do
    Bundler.with_clean_env do
      app_name = 'emberscreencasts'
      sh "heroku pg:backups capture --app #{app_name}"
      sh "curl -o latest.dump `heroku pg:backups public-url -a #{app_name}`"
      sh "pg_restore --verbose --clean --no-acl --no-owner -h localhost -d sparks/development latest.dump"
      sh "rake db:migrate"
    end
  end
end