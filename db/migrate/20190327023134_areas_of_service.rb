class AreasOfService < ActiveRecord::Migration[5.2]
  def change
    create_table :areas_of_service do |t|
      t.text :description
      t.string :headline
      t.string :title

      t.timestamps null: false
    end
  end
end
