class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :assignments
  has_many :roles, through: :assignments

  # extend FriendlyId
  # friendly_id :email

  def has_role?(role)
    roles.any? { |r| r.name.underscore.to_sym == role }
  end
end
