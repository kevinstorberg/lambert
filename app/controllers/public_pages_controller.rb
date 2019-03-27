class PublicPagesController < ApplicationController

  def home
  end

  def about
  end

  def team
    @team = User.team
  end

  def contact
    render 'contact.js'
  end
end
