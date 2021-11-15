class User < ApplicationRecord
  validates :username, presence: true, 
                    uniqueness: { case_sensitive: false }, 
                    length: { minimum: 3, maximum: 25 }
  VALID_EMAIL_REGEX = /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  validates :email, presence: true, 
                    uniqueness: { case_sensitive: false }, 
                    length: { maximum: 105 },
                    format: { with: VALID_EMAIL_REGEX }
end