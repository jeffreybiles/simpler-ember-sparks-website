class PostsController < InheritedResources::Base

  def index
    if params[:tag]
      @posts = Post.tagged_with(params[:tag])
    else
      @posts = Post.all
    end
    @posts = @posts.published.recent_first
  end
end
