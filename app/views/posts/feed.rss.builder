#encoding: UTF-8

xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "EmberScreencasts"
    xml.author "Jeffrey Biles"
    xml.description "Concise weekly screencasts about Ember and friends"
    xml.link "https://emberscreencasts.com"
    xml.language "en"
    xml.copyright "Copyright 2014-2015 Happy Programmer LLC"
    xml.image do
      xml.url "https://s3.amazonaws.com/spark-casts/logo.jpg"
      xml.link "https://emberscreencasts.com"
      xml.title "EmberScreencasts"
    end

    for post in @posts
      xml.item do
        link = "https://www.emberscreencasts.com/posts/#{post.permalink}"

        xml.title post.title
        xml.author "Jeffrey Biles"
        xml.pubDate post.publish_date.iso8601
        xml.link link
        xml.source link
        xml.guid post.guid
        xml.enclosure("url" => "https://embed-ssl.wistia.com/deliveries/#{post.guid}/file.mp4?rss=true", "length" => 0, "type" => 'video/mp4')

        text = raw @markdown.render post.description
        text += image_tag post.thumbnail_image, class: "img-responsive"
        text += raw "<br>"
        text += raw "<a href=#{link}>Watch video</a>"
        text += raw "<br>"
        text += raw "<h3>More Like This</h3>"
        post.tags.each do |tag|
          text += raw "<b>#{tag.tag_type}</b>: "
          text += raw "<a href='https://www.emberscreencasts.com/tags/#{tag.permalink}'>#{tag.name}</a>"
          text += raw "<br>"
        end
        if post.links.length > 0
          text += raw "<h3>External Links</h3>"
          text += raw "<div class='links'>#{raw @markdown.render post.links}</div>"
        end
        xml.description do
          xml.cdata! text
        end
      end
    end
  end
end
