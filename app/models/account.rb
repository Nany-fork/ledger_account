class Account < ApplicationRecord
  has_one :user
  enum status: [:health, :danger, :bad]
end
