class PagesController < ApplicationController
  def about

  end

  def ember_admin
    @accessories = ['hats', 'boots', 'scarves'] #this could easily be from the database
  end
end
