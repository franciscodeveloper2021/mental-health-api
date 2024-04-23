class Answer < ApplicationRecord
  belongs_to :question

  validates :content,
            presence: true

  validates :question_id,
            presence: true

  after_create :update_instrument_status

  def update_instrument_status
    self.question.instrument.update_status
  end
end
