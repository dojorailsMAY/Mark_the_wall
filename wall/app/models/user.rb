class User < ApplicationRecord
  has_many :commments
  has_many :messages
  validates :email, :name, :password, presence: true, uniqueness: true
end
