#encoding: UTF-8

xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "EmberScreencasts"
    xml.author "Jeffrey Biles"
    xml.description "Concise weekly screencasts about Ember and friends"
    xml.link "https://emberscreencasts.com"
    xml.language "en"

    for post in @posts
      xml.item do
        link = "https://www.emberscreencasts.com/posts/#{post.permalink}"

        xml.title post.title
        xml.author "Jeffrey Biles"
        xml.pubDate post.publish_date.to_s(:rfc822)
        xml.link link
        xml.guid post.id

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
        xml.description text
      end
    end
  end
end
