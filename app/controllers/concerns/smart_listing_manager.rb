module SmartListingManager
  extend ActiveSupport::Concern

  private
  # ============================================================================
  # Lists ======================================================================
  # ============================================================================
  # def list_roles
  #   @roles = smart_listing_create(:roles, @roles, partial: "/roles/index",
  #                                 default_sort: { created_at: "desc" }, page_sizes: [10, 50, 100])
  # end

  # def list_users
  #   @users = smart_listing_create(:users, @users, partial: "/users/index",
  #                                 default_sort: { last_name: "asc" }, page_sizes: [10, 50, 100])
  # end


  # ============================================================================
  # Logic ======================================================================
  # ============================================================================
  # manage_smart_listing takes an array of keys which name private methods in the form of 'list_resource_name'
  # Create lists in this form and include the instance variable '@list' in the smart_listing_update
  # Doing this ensures that ajax requests do not clash with smart_listing
  def manage_smart_listing(*methods)
    respond_to do |format|
      format.html do
        methods.each do |method|
          send("list_#{method.to_s}".to_sym)
        end
      end

      format.js do
        params.keys.each do |key|
          if key.last(7) == "listing"
            name = key.chomp("_smart_listing")
            send("list_#{name}".to_sym)
            @list = name.to_sym
          end
        end
      end
    end
  end
end
