class ServiceAreasController < ApplicationController

  before_action :set_service_area,       only: @crud_actions
  before_action :authorize_service_area, only: @crud_actions

  def index
    @service_areas = ServiceArea.all
    manage_smart_listing(:service_areas)
  end

  def new
  end

  def create
    @service_area.assign_attributes(service_area_params)
    if @service_area.save
      flash_message('success')
    else
      flash_message('alert')
    end

    redirect_back fallback_location: root_url
  end

  def edit
  end

  def update
    if @service_area.update_attributes(service_area_params)
      flash_message('success')
    else
      flash_message('alert')
    end

    redirect_back fallback_location: root_url
  end

  def destroy
    if @service_area.destroy
      flash_message('success')
    else
      flash_message('alert')
    end

    redirect_back fallback_location: root_url
  end

  private

  def authorize_service_area
    return redirect_to root_url unless current_user.present?
    authorize @service_area
  end

  def set_service_area
    @service_area = params[:id].present? ? ServiceArea.find(params[:id]) : ServiceArea.new
  end

  def service_area_params
    params.require(:service_area).permit(
      :description,
      :headline,
      :id,
      :title,
      service_sub_areas_attributes: [
        :description,
        :headline,
        :id,
        :service_area_id,
        :title]
    )
  end
end
