class PostsController < ApplicationController
  before_action :authenticate_with_basic_auth, only: :feed

  def index
    @posts = Post.all
    if params[:free]
      @posts = @posts.free
    end
    if params[:difficulty]
      @posts = @posts.where(difficulty: params[:difficulty])
    end
    if params[:latest]
      @latest = true
      @posts  = @posts.limit(10)
    end
    @posts = @posts.published.recent_first
  end

  def show
    @post           = Post.find_by_permalink(params[:id]) || Post.find(params[:id])
    @previous_post  = Post.where("publish_date < ?", @post.publish_date).order(:publish_date).last
    @next_post      = Post.where("publish_date > ?", @post.publish_date).order(:publish_date).first

    @viewable_by_user   = @post.free || (current_user && current_user.can_watch_pro)
    @referrer           = request.referrer
    @first_click_free   = @referrer =~ /.*\.google\..*/
    @viewable_by_google = @first_click_free || @viewable_by_user
    @transcript_present = @post.transcript && @post.transcript != 'null'
    @code_present       = @post.code && @post.code != 'null'
  end

  # Feed constructed with help from https://www.codingfish.com/blog/129-how-to-create-rss-feed-rails-4-3-steps
  def feed
    @posts = Post.published.recent_first
    unless current_user.try(:subscribed)
      @posts = @posts.free
    end
    respond_to do |format|
      format.rss {render :layout => false}
    end
  end

  def authenticate_with_basic_auth
    case request.format
    when Mime::XML, Mime::ATOM, Mime::RSS
      user = authenticate_with_http_basic do |username, password|
        found_user = User.find_by(email: username) || User.new
        found_user.valid_password?(password) ? found_user : nil
      end

      if user
        if user.subscribed
          sign_in(user)
        end
      else
        request_http_basic_authentication
      end
    end
  end
end
