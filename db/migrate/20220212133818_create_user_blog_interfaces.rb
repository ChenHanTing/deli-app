class CreateUserBlogInterfaces < ActiveRecord::Migration[6.1]
  def change
    create_table :user_blog_interfaces do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :blog, foreign_key: true

      t.timestamps
    end
  end
end
