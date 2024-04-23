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

  after_create :update_status

  def update_status
    new_status = if questions.count.zero? || questions.joins(:answer).distinct.count.zero?
      :pendent
    elsif questions.count == questions.joins(:answer).distinct.count
      :done
    else
      :pendent
    end

    update_columns(status: new_status)
  end
end
