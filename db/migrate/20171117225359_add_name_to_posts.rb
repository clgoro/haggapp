class AddNameToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :person_name, :string
  end
end
