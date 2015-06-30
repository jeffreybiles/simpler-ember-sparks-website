require 'redis'

class EmberAdminController < ApplicationController
  def index
    redis = Redis.new
    index_key &&= "ember-admin:#{manifest_id}"
    index_key ||= REDIS.get("ember-admin:current")
    html = REDIS.get(index_key)
    render :text => html
  end

  def manifest_id
    params[:index_key]
  end
end