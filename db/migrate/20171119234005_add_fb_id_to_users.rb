class AddFbIdToUsers < ActiveRecord::Migration[5.1]
  def change
  	add_column :users, :fb_id, :integer, limit: 8
  end
end
