class Blog < ApplicationRecord
  has_many :articles
  has_and_belongs_to_many :users, join_table: "user_blog_interfaces"
end
