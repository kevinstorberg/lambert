class UsersController < ApplicationController

  before_action :set_user,       only: @crud_actions
  before_action :authorize_user, only: @crud_actions

  def index
    @users = User.all
    manage_smart_listing(:users)
  end

  def show
  end

  def new
  end

  def create
    @user.assign_attributes(user_params)
    if @user.save!
      flash_message('success')
    else
      flash_message('alert')
    end

    redirect_back fallback_location: root_url
  end

  def edit
  end

  def update
    @user.assign_attributes(user_params)
    if @user.save
      flash_message('success')
    else
      flash_message('alert')
    end

    redirect_back fallback_location: root_url
  end

  def destroy
    if @user.destroy?
      flash_message('success')
    else
      flash_message('alert')
    end

    redirect_back fallback_location: root_url
  end

  # ============================================================================
  def edit_password
    @user = User.find(params[:user_id])
    render 'edit_password.js'
  end

  def update_password
    @user = User.find(params[:user_id])
    if user_params[:password] == user_params[:password_confirmation] && @user.update_attributes(password: user_params[:password])
      sign_in(@user, :bypass => true) if @user.id == current_user.id
      flash_message('update_password_success')
    else
      flash_message('update_password_fail')
    end
    return render js: "window.location = '#{request.referrer}';"
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
      :avatar,
      :email,
      :first_name,
      :id,
      :last_name,
      :long_bio,
      :password,
      :password_confirmation,
      :remember_created_at,
      :reset_password_sent_at,
      :reset_password_token,
      :role,
      :short_bio,
      :titles)
  end
end
