class Instrument < ApplicationRecord

  validates :title,
            presence: true,
            length: { minimum: 5, maximum: 40 }

  validates :description,
            presence: true,
            length: { minimum:10, maximum: 300 }
end
