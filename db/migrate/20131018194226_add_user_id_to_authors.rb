class AddUserIdToAuthors < ActiveRecord::Migration
  def change
    add_column :authors, :user_id, :string
  end
end
