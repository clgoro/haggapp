class RemoveFbIdFromUsers < ActiveRecord::Migration[5.1]
  def change
  	remove_column :users, :fb_id, :integer
  end
end
