class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :question
      t.references :poll, index: true
    end
    add_foreign_key :questions, :polls
  end
end
