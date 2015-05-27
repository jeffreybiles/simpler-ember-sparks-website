namespace :one_timers do
  desc 'backup and download heroku database'
  task :add_permalink => :environment do
    Tag.all.each(&:add_permalink)
  end

  task :generate_for_ember_watch => :environment do
    file = File.open 'emberwatch_yaml', 'w' do |f|
      Post.recent_first.each do |post|
        generate_yaml(post, f)
      end
    end
  end
end

def generate_yaml(post, file)
  file.puts "- title: #{post.title}"
  file.puts "  author_ids:"
  file.puts "  - 58"
  file.puts "  date: #{post.publish_date}"
  file.puts "  url: http://www.emberscreencasts.com/posts/#{post.permalink}"
  file.puts "  videos:"
  file.puts "  - http://www.emberscreencasts.com/posts/#{post.permalink}"
  file.puts "  series: EmberScreencasts"
  file.puts "  price: $9/month" if !post.free
end