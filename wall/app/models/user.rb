class User < ApplicationRecord
	has_many :commments
	has_many :messages
	validates :email, :name, :password, presence: true
	validates :email, uniqueness: true  # only email needs to be unique
end
