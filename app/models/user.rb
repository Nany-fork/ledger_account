class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :account
  after_create :create_account

  def create_account
    @user = User.find(self.id)
    @account = Account.new
    @user.account = @account
    @user.save
    @account.save
  end
end
