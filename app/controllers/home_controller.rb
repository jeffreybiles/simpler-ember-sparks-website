class HomeController < ApplicationController
  def index
    @posts = Post.all.published.recent_first
  end
end