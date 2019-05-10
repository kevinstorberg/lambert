class CreatePublicPages < ActiveRecord::Migration[5.2]
  def change
    create_table :public_pages do |t|
      t.text :copy_0

      t.timestamps null: false
    end
  end
end
