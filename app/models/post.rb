class Post < ActiveRecord::Base
  default_scope {where("publish_date < ?", Date.today).order('publish_date DESC')}
end
