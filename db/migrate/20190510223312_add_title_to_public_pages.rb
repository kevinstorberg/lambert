class AddTitleToPublicPages < ActiveRecord::Migration[5.2]
  def change
    add_column :public_pages, :title, :string
  end
end
