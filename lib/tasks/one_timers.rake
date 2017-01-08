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

  task :generate_for_ember_links => :environment do
    CSV.open('emberscreencasts_for_ember_links.csv', 'wb') do |csv|
      csv << ['number', 'title', 'date', 'link', 'free', 'hashid', 'embed']
      Post.recent_first.each do |post|
        number = post.title.split(/[-:]/)[0]
        title = post.display_title
        link = "https://www.emberscreencasts.com/posts/#{post.permalink}"
        if post.free then
          src = /fast.wistia.net\/embed\/iframe\/(\S{10})/.match(post.wistia_embed)
          if !src then src = /wistia_async_(\S{10})/.match(post.wistia_embed) end
          if !src then src = /id="wistia_(\S{10})"/.match(post.wistia_embed) end
          hashid = if src then src.captures[0] else nil end
          if !hashid then puts "no hashid for #{number}- #{title}" end
            embed = '<script charset="ISO-8859-1" src="//fast.wistia.com/assets/external/E-v1.js" async></script>
              <div class="wistia_embed wistia_async_' + hashid + ' videoFoam=true" style="width:640px;height:360px;">&nbsp;</div>'
        end
        csv << [number, title, post.publish_date, link, post.free, hashid, embed]
      end
    end
  end


  task :users_since => :environment do
    since_date = Date.new(2016, 6, 30)
    users = User.where("created_at > ?", since_date)
    CSV.open('users_since_time.csv', 'wb') do |csv|
      csv << ['email']
      users.each do |user|
        csv << [user.email]
      end
    end
  end

  task :resize_wistia => :environment do
    new_width = 800
    new_height = 500

    Post.all.each do |post|
      embed = post.wistia_embed
      if embed
        embed = embed.gsub(/width:.?\d+px/, "width:#{new_width}px")
        embed = embed.gsub(/height:.?\d+px/, "height:#{new_height}px")
        post.update(wistia_embed: embed)
      end
    end
  end

  task :unsubscribe_all => :environment do
    User.where(subscribed: true).each do |user|
      customer = Stripe::Customer.retrieve(user.stripe_customer_id)
      customer.subscriptions.each do |subscription| #just in case we accidentally got 2 subscriptions
        customer.subscriptions.retrieve(subscription.id).delete
      end
    end
  end
end

def generate_yaml(post, file)
  file.puts "- title: '#{post.title}'"
  file.puts "  author_ids:"
  file.puts "  - 58"
  file.puts "  date: #{post.publish_date}"
  file.puts "  url: http://www.emberscreencasts.com/posts/#{post.permalink}"
  file.puts "  videos:"
  file.puts "  - http://www.emberscreencasts.com/posts/#{post.permalink}"
  file.puts "  series: EmberScreencasts"
  file.puts "  price: $9/month" if !post.free
end
