class TagsController < ApplicationController

  def index
    if current_user
      Analytics.track(user_id: current_user.email, event: 'Viewed Tags Index')
    else
      Analytics.track(anonymous_id: session.id || 'new', event: 'Viewed Tags Index')
    end
    @series = Tag.where(tag_type: 'series')
    @subjects = Tag.where(tag_type: 'subject')
  end

  def show
    @tag = Tag.find_by_permalink(params[:id])
    properties = {
      tag_id: @tag.id,
      tag_name: @tag.name,
      tag_length: @tag.taggings.length,
      tag_type: @tag.tag_type
    }
    @posts = @tag.taggings.map(&:post)
    if @tag.tag_type == 'series'
      @posts = @posts.sort_by(&:publish_date)
    else
      @posts = @posts.sort {|a, b| b.publish_date <=> a.publish_date}
    end
    if current_user
      Analytics.track(user_id: current_user.email, event: 'Viewed Tag Page', properties: properties)
    else
      Analytics.track(anonymous_id: session.id || 'new', event: 'Viewed Tag Page', properties: properties)
    end
    render 'posts/index'
  end
end
