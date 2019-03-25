class StaticPagesController < ApplicationController

  def home
  end

  def contact_us
    render 'contact_us.js'
  end
end
