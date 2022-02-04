class Account < ApplicationRecord
  belongs_to :user
  has_many :movements
  enum status: [:health, :danger, :bad]
end
