class AddIndexToResponses < ActiveRecord::Migration
  def change
    add_index :responses, [:answer_id, :user_id], unique: true
  end
end
