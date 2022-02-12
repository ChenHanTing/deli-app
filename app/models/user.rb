class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :role
  before_create :set_default_role
  # or
  # before_validation :set_default_role
  has_and_belongs_to_many :blogs, join_table: "user_blog_interfaces"

  private

  def set_default_role
    self.role ||= Role.find_by_name('registered')
  end
end
