class Letter < ApplicationRecord
    validates :name, presence: true
    validates :phone, presence: true, length: { minimum: 6 }
    validates :title, presence: true, length: { minimum: 10 }
    validates :description, presence: true, length: { minimum: 20 }
    validates :files, presence: true
    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end
