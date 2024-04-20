class Evaluated < ApplicationRecord

  EMAIL_REGEX = /\A[\w!#$%&'*+\/=?`{|}~^-]+(?:\.[\w!#$%&'*+\/=?`{|}~^-]+)*@(?:[a-zA-Z0-9-]+\.)+[a-zA-Z]{2,6}\z/
  CPF_REGEX = /\A\d{3}\.\d{3}\.\d{3}-\d{2}\z/

  has_many :evaluated_instruments
  has_many :instruments, through: :evaluated_instruments

  validates :name,
            presence: true,
            length: { minimum: 2, maximum: 50 }

  validates :email,
            presence: true,
            format: { with: EMAIL_REGEX },
            length: { maximum: 254 },
            uniqueness: { case_sensitive: false }

  validates :cpf,
            presence: true,
            format: { with: CPF_REGEX, message: "must be in the format xxx.xxx.xxx-xx" },
            uniqueness: true

  validates :birthdate, presence: true
end