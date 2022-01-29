class Account < ApplicationRecord
  belongs_to :user
  enum status: [:health, :danger, :bad]
end
