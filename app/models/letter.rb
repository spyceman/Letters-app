class Letter < ApplicationRecord
    validates :name, presence: true
    validates :phone, presence: true, length: { minimum: 13 }
    validates :title, presence: true, length: { minimum: 50 }
    validates :description, presence: true, length: { minimum: 100 }
    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end
