class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :age, numericality: { :greater_than => 17, :message => "You must be 18 years or older" }

  has_one :account

  after_create :create_account

  def create_account
    Account.create!(user: self)
  end

end
