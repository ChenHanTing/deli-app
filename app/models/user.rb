class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :role
  before_validation :set_default_role
  before_create :generate_authentication_token
  # or
  # before_validation :set_default_role
  has_and_belongs_to_many :blogs, join_table: "user_blog_interfaces"
  # https://stackoverflow.com/questions/2799746/habtm-relationship-does-not-support-dependent-option
  before_destroy { blogs.clear }

  # Banned user cannot be loggin
  def active_for_authentication?
    super && self.role&.name != "banned"
  end

  def generate_authentication_token
    self.authentication_token = Devise.friendly_token
  end

  def regenerate_auth_token
    self.authentication_token = Devise.friendly_token
    self.save!
  end

  private

  def set_default_role
    self.role ||= Role.find_by_name('registered')
  end
end
