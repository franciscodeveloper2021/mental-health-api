class Instrument < ApplicationRecord

  has_and_belongs_to_many :evaluateds, join_table: :evaluated_instruments
  has_many :questions

  validates :title,
            presence: true,
            length: { minimum: 5, maximum: 40 }

  validates :description,
            presence: true,
            length: { minimum:10, maximum: 300 }

  enum status: { pendent: 0, done: 1 }

  def update_status
    if self.questions.empty?
      self.update(status: :pendent)
    elsif self.questions.count == self.questions.joins(:answer).distinct.count
      self.update(status: :done)
    else
      self.update(status: :pendent)
    end
  end
end
