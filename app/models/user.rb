class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def employee?
    # ['staff', 'boss', 'admin'].include?(role)
    role.in? ['staff', 'boss', 'admin']
  end
end
