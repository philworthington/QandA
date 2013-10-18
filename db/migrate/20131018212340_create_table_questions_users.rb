class CreateTableQuestionsUsers < ActiveRecord::Migration
  def up
     create_table "questions_users", :force => true do |t|
      t.integer "question_id"
      t.integer "user_id"
    end
  end

  def down
  end
end
