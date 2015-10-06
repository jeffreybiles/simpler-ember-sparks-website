namespace :utils do
  desc 'backup and download heroku database'
  task :hours_of_video => :environment do
    puts Post.all.map(&:seconds).sum/3600.0
  end
end
