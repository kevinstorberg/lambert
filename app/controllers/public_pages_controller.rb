class PublicPagesController < ApplicationController

  before_action :set_public_page,       only: [:edit, :update]
  before_action :authorize_public_page, only: [:edit, :update]

  def home
    @public_page = PublicPage.find_by_title('home')
  end

  def about
    @public_page   = PublicPage.find_by_title('about')
    @service_areas = ServiceArea.all.order(title: :asc)
  end

  def team
    @public_page   = PublicPage.find_by_title('team')
    @team          = User.team
  end

  def contact
    instantiate_params(:remove_backdrop)
    render 'contact.js'
  end

  # ============================================================================
  # Admin ======================================================================
  # ============================================================================
  def index
    authorize @public_pages = PublicPage.all.order(title: :asc)
  end

  def edit
  end

  def update
    @public_page.assign_attributes(public_page_params)
    if @public_page.save
      flash_message('success')
    else
      flash_message('alert')
    end

    redirect_back fallback_location: root_path
  end

  private

  def authorize_public_page
    authorize @public_page
  end

  def set_public_page
    @public_page = PublicPage.find(params[:id])
  end

  def public_page_params
    params.require(:public_page).permit(:copy_0)
  end
end
