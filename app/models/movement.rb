class Movement < ApplicationRecord
  belongs_to :movement_type
  belongs_to :account
end
