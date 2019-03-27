class RenameServiceAreasTables < ActiveRecord::Migration[5.2]
  def change
    rename_table :areas_of_service, :service_areas
    rename_table :sub_areas_of_services, :service_sub_areas
    rename_column :service_sub_areas, :areas_of_service_id, :service_area_id
  end
end
