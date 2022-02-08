class Movement < ApplicationRecord
  belongs_to :movement_type
  belongs_to :account

  validates :name, length: {maximum: 50}
  validates :description, length: {minimum: 10}
  validate :after_date_creation

  after_create :update_acount_balance

  def after_date_creation
    if self.date > Date.today
      errors.add(:date, "can't be in the future")
    end
  end

  def update_acount_balance
    case self.movement_type_id
      # ingresos 
    when 1
      self.account.update(balance: self.account.balance + self.ammount)
      # egresos
    when 2
      self.account.update(balance: self.account.balance - self.ammount)
      # pagos o abonos
    when 3
      self.account.update(balance: self.account.balance - self.ammount)
    end
  end
end
