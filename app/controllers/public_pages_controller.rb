class PublicPagesController < ApplicationController

  def home
  end

  def about
    @service_areas = ServiceArea.all
  end

  def team
    @team = User.team
  end

  def contact
    render 'contact.js'
  end
end
