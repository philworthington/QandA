class AddIdToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :question_id, :integer
  end
end
