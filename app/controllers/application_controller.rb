require 'rouge'
require 'rouge/plugins/redcarpet'

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :markdown_renderer

  def markdown_renderer
    @renderer ||= Html.new(:hard_wrap => true)
    @markdown ||= Redcarpet::Markdown.new(@renderer,
      autolink: true,
      no_intra_emphasis: true,
      fenced_code_blocks: true,
      disable_indented_code_blocks: true)
  end
end

class Html < Redcarpet::Render::HTML
  include Rouge::Plugins::Redcarpet

  def image(link, title, alt_text)
    return ''
    # We'll have to figure out a way to get the images out of ghost
    # For now, we'll just remove them
    # return "<img src='http://emberscreencast-markdown-editing-dont-publish.ghost.io#{link}' title='#{title}' alt='#{alt_text}'"
  end
end
