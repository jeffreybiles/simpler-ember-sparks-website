class TagsController < ApplicationController

  def index
    @series = Tag.where(tag_type: 'series')
  end

  def show
    @tag = Tag.find_by_permalink(params[:id])
    if !@tag
      flash[:error] = "There is no tag with that name.  Select another?"
      redirect_to tags_url
    else
      @posts = @tag.taggings.map(&:post)
      if @tag.tag_type == 'series'
        @posts = @posts.sort_by(&:publish_date)
      else
        @posts = @posts.sort {|a, b| b.publish_date <=> a.publish_date}
      end
      render 'posts/index'
    end
  end
end
