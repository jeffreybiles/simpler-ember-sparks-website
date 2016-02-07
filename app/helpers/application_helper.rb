module ApplicationHelper
  def tag_cloud(tags, classes)
    max = tags.sort_by(&:taggings_count).last
    tags.shuffle.each do |tag|
      index = tag.taggings_count.to_f / max.taggings_count * (classes.size - 1)
      yield(tag, classes[index.round])
    end
  end
end
