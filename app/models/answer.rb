class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  validates :answer, presence: true
  has_many :responses, dependent: :destroy
  has_many :users, through: :responses
end
