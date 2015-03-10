class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.references :user, index: true
      t.references :answer, index: true
      
    end
    add_foreign_key :responses, :users
    add_foreign_key :responses, :answers
  end
end
