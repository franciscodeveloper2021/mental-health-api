class Instrument < ApplicationRecord

  has_many :evaluated_instruments
  has_many :evaluated, through: :evaluated_instruments

  validates :title,
            presence: true,
            length: { minimum: 5, maximum: 40 }

  validates :description,
            presence: true,
            length: { minimum:10, maximum: 300 }
end
