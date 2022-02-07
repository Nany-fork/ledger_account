class MovementCategory < ApplicationRecord
  belongs_to :movement_type
  validates :name , length: {in: 1..10}
  validates :movement_type_id , presence: true
end
