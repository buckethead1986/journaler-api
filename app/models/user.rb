class User < ApplicationRecord
  has_secure_password

  has_many :journals, dependent: :destroy

  validates :username, presence: true
  validates :username, uniqueness: true

end
