class PostsController < ApplicationController

  def index
    if current_user
      Analytics.track(user_id: current_user.email, event: 'Viewed Video Index')
    else
      Analytics.track(anonymous_id: session.id || 'new', event: 'Viewed Video Index')
    end
    @posts = Post.all
    if params[:free]
      @posts = @posts.free
    end
    if params[:difficulty]
      @posts = @posts.where(difficulty: params[:difficulty])
    end
    @posts = @posts.published.recent_first
  end

  def show
    @post = Post.find_by_permalink(params[:id]) || Post.find(params[:id])
    properties = {
      video_id: @post.id,
      video_title: @post.title,
      publish_date: @post.publish_date
    }

    properties['video_type'] = if @post.free then 'Free' else 'Pro' end
    if current_user
      Analytics.track(user_id: current_user.email, event: 'Viewed Video Page', properties: properties)
    else
      Analytics.track(anonymous_id: session.id || 'new', event: 'Viewed Video Page', properties: properties)
    end
  end

  # Feed constructed with help from https://www.codingfish.com/blog/129-how-to-create-rss-feed-rails-4-3-steps
  def feed
    @posts = Post.published.recent_first
    respond_to do |format|
        format.rss {render :layout => false}
    end
  end
end
