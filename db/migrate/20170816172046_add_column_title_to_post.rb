class AddColumnTitleToPost < ActiveRecord::Migration[5.0]
  def change
  	add_column :posts, :title, :string
  	add_column :posts, :description, :string
  	remove_column :posts, :content
  end
end
