class StaticPagesController < ApplicationController

  def home
  end

  def about
  end

  def team
  end

  def contact_us
    render 'contact.js'
  end
end
