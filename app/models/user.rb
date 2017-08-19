class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  #validationa
  has_many :posts, dependent: :destroy

  def generate_authentication_token
    token = ""
    loop do
      token = Devise.friendly_token
      break token unless User.where(auth_token: token).first
    end
    self.update_attributes(auth_token: token)
  end

end
