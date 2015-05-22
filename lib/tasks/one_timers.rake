namespace :one_timers do
  desc 'backup and download heroku database'
  task :add_permalink => :environment do
    Tag.all.each(&:add_permalink)
  end
end