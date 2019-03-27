class CreateSubAreasOfService < ActiveRecord::Migration[5.2]
  def change
    create_table :sub_areas_of_services do |t|
      t.integer :areas_of_service_id

      t.text :description
      t.string :headline
      t.string :title

      t.timestamps null: false
    end
  end
end
