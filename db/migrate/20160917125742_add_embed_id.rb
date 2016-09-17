class AddEmbedId < ActiveRecord::Migration
  def change
    add_column :posts, :embed_id, :string

    Post.all.each do |post|
      src = /fast.wistia.net\/embed\/iframe\/(\S{10})/.match(post.wistia_embed)
      if !src then src = /wistia_async_(\S{10})/.match(post.wistia_embed) end
      if !src then src = /id="wistia_(\S{10})"/.match(post.wistia_embed) end
      embed_id = if src then src.captures[0] else nil end
      if !embed_id then puts "no embed_id for #{number}- #{title}" end
      post.update_attributes(embed_id: embed_id)
    end
  end
end
