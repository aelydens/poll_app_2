class Question < ActiveRecord::Base
  has_many :answers, dependent: :destroy
  validates :question, presence: true
  accepts_nested_attributes_for :answers, reject_if: :all_blank, allow_destroy: true
  belongs_to :poll
end
