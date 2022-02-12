class AddBlogIdAndNameToUser < ActiveRecord::Migration[6.1]
  def change
    add_reference :users, :blog, foreign_key: true
    add_column :users, :name, :string
  end
end
