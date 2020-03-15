class Tenant < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable
  belongs_to :user
  has_one :lease
  #has_many :property_units

  protected
    def password_required?
      confirmed? ? super : false
    end
end
