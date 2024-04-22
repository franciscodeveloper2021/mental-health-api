class Question < ApplicationRecord
  belongs_to :instrument

  validates :content,
            presence: true,
            length: { minimum: 5, maximum: 400 }
end
