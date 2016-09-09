class HomeController < ApplicationController
  def index
    @posts = Post.all.published.recent_first
    @tags = [Tag.find(88), Tag.find(86), Tag.find(43)] #later do something with weighted randomness
  end
end
