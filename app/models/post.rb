class Post < ApplicationRecord
	belongs_to :user
	has_many :taggings
	validates :user_id, presence: true
end
