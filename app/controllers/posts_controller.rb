class PostsController < InheritedResources::Base

  def index
    if current_user
      Analytics.track(user_id: current_user.email, event: 'Viewed Video Index')
    else
      Analytics.track(anonymous_id: session.id, event: 'Viewed Video Index')
    end
    if params[:tag]
      @posts = Post.tagged_with(params[:tag])
    else
      @posts = Post.all
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
    if @post.free
      if current_user
        Analytics.track(user_id: current_user.email, event: 'Viewed Free Video', properties: properties)
      else
        Analytics.track(anonymous_id: session.id, event: 'Viewed Free Video', properties: properties)
      end
    else
      if current_user.andand.subscribed
        Analytics.track(user_id: current_user.email, event: 'Viewed Pro Video', properties: properties)
      else
        Analytics.track(anonymous_id: session.id, event: 'Attempted View Pro Video', properties: properties)
      end
    end
  end
end
