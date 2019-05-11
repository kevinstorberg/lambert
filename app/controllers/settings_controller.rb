class SettingsController < ApplicationController

  before_action :authorize_settings

  def edit
  end

  def update
    settings_params.each do |setting, value|
      Setting.send("#{setting}=", value) unless value.nil?
    end

    flash_message('success')
    redirect_back fallback_location: root_url
  end

  private

  def authorize_settings
    return redirect_to root_url unless current_user.present? && current_user.any_admin?
  end

  def settings_params
    params.permit(:display_login_link)
  end
end
