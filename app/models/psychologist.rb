class Psychologist < ApplicationRecord
  has_secure_password

  validates :name, presence: true, length: { minimum: 2, maximum: 50 }
end

