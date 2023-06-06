class AddMissingColumnsToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :username, :string
    add_column :users, :age, :integer
    add_column :users, :city, :string
    add_column :users, :bio, :text
  end
end
