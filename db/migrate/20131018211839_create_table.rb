class CreateTable < ActiveRecord::Migration
  def up
    create_table "quests_users", :force => true do |t|
      t.integer "quest_id"
      t.integer "user_id"
    end
  end

  def down
  end
end
