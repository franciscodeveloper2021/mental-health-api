class Question < ApplicationRecord
  belongs_to :instrument

  has_one :answer

  validates :content,
            presence: true,
            length: { minimum: 5, maximum: 400 }

  validates :instrument_id,
            presence: true
end
