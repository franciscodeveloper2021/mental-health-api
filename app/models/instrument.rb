class Instrument < ApplicationRecord

  has_and_belongs_to_many :evaluateds, join_table: :evaluated_instruments

  validates :title,
            presence: true,
            length: { minimum: 5, maximum: 40 }

  validates :description,
            presence: true,
            length: { minimum:10, maximum: 300 }
end
