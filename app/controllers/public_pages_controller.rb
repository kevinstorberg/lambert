class PublicPagesController < ApplicationController

  def home
  end

  def about
    @service_areas = ServiceArea.all.order(title: :asc)
  end

  def team
    @team = User.team
  end

  def contact
    instantiate_params(:remove_backdrop)
    render 'contact.js'
  end
end
