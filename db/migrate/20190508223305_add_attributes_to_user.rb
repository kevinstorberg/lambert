class AddAttributesToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :short_bio, :text
    add_column :users, :long_bio, :text
  end
end
