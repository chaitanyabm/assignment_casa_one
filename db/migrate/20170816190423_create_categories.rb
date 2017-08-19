class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :category_title
      t.string :category_description

      t.timestamps
    end
  end
end
