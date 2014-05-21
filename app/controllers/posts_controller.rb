class PostsController < InheritedResources::Base

  def index
    if params[:tag]
      @posts = Post.tagged_with(params[:tag])
    else
      @posts = Post.all
    end
    @posts = @posts.published.recent_first
  end

  def show
    @post = Post.find_by_permalink(params[:id]) || Post.find(params[:id])
  end
end
