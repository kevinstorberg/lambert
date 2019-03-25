class UsersController < ApplicationController

  before_action :set_user,      only: @@crud_actions
  before_action :authorize_user, only: @@crud_actions

  def index
    @users = User.all
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
    if @user.destroy?
      
    else

    end
  end

  private

  def authorize_user
    return redirect_to root_url unless @user.present?
    authorize @user
  end

  def set_user
    @user = params[:id].present? ? User.find(params[:id]) : User.new
  end

  def user_params
    params.require(:user).permit(
      :email,
      :first_name,
      :id,
      :last_name,
      :remember_created_at,
      :reset_password_sent_at,
      :reset_password_token,
      :role,
      :titles)
  end
end
