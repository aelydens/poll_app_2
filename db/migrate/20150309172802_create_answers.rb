class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :answer
      t.references :question, index: true
    end
    add_foreign_key :answers, :questions
  end
end
