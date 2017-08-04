class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  attr_accessor :login
  has_one:profile,dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :authentication_keys => [:login]
  validates :format, presence: true
  def self.find_first_by_auth_conditions(warden_conditions)
    
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["username = :value OR lower(email) = lower(:value)", { :value => login }]).first
    else
      where(conditions).first
    end
  end     
  
  def name_display
    if current_user.display_name != nil
      current_user.display_name
    else
      current_user.username
    end
  end
end
