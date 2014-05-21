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
    if params[:id].to_i
      @post = Post.find(params[:id])
    else
      @post = Post.find_by_permalink(params[:id])
    end
  end
end
