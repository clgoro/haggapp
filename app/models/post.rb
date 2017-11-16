class Post < ApplicationRecord
	belongs_to :user, foreign_key: 'user_id'
  has_many :taggings
  has_many :tags, through: :taggings
  
  def all_tags=(names)
    self.tags = names.split(", ").map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end
  
  def all_tags
    self.tags.map(&:name).join(", ")
  end

  def self.tagged_with(name)
    Tag.find_by_name!(name).posts
  end
end
