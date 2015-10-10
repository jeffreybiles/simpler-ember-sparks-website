class PagesController < ApplicationController
  def about

  end

  def meta_guide_to_upgrading_ember
    @text_from_file = File.read(Rails.root.join('The Meta Guide to Upgrading Ember.md'))
  end
end
