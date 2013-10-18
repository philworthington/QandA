class AddIdToAuthors < ActiveRecord::Migration
  def change
    add_column :authors, :question_id, :integer
  end
end
