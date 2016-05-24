class HomeController < ApplicationController
  def index
    @posts = Post.all.published.recent_first
    @tags = [Tag.find(80), Tag.find(76), Tag.find(68)] #later do something with weighted randomness
  end
end
