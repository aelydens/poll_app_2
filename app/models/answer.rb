class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user

  has_many :responses, dependent: :destroy
  has_many :users, through: :responses
end
