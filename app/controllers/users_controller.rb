class UsersController < ApplicationController

  before_action :set_user,      only: @@crud_actions
  before_action :authoriz_user, only: @@crud_actions

  private

  def user_params
    
  end
end
