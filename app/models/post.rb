class Post < ApplicationRecord
	belongs_to :user, :foreign_key => :user_id
	has_many :categories
  	# accepts_nested_attributes_for :categories, :category_title
  	# accepts_nested_attributes_for :categories, :category_description
end
