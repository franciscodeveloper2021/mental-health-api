class Answer < ApplicationRecord
  belongs_to :question

  validates :content,
            presence: true

  validates :question_id,
            presence: true
end
