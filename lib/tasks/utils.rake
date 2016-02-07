require 'csv'

namespace :utils do
  desc 'backup and download heroku database'
  task :hours_of_video => :environment do
    puts Post.all.map(&:seconds).sum/3600.0
  end

  desc 'find the users that are subscribed on stripe but not in AR'
  task :stripe_user_diff => :environment do
    # will use a csv file that is .gitignored since it contains private info
    stripe_users = []
    CSV.foreach("customers.csv", headers: true) do |row|
      stripe_users.push row['Email']
    end

    db_users = User.where(subscribed: true).map(&:email)

    puts "USERS IN STRIPE BUT NOT DB"
    puts stripe_users - db_users
    puts "USERS IN DB BUT NOT STRIPE"
    (db_users - stripe_users).each do |email|
      user = User.find_by(email: email)
      puts "#{email}: #{user.stripe_customer_id}"
    end

    # note that there will be some differences in email address between stripe & DB.
    # This sucks, but 5 minutes of comparing stripe_customer_ids should do the trick
  end

  desc 'resetting the caches'
  task :set_caches => :environment do
    Tag.find_each { |tag| Tag.reset_counters(tag.id, :taggings) }
    Tag.find_each { |tag| tag.updated_publish_date}
  end
end
