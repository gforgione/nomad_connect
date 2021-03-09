class AddSocialsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :website, :string
    add_column :users, :twitter, :string
    add_column :users, :instagram, :string
    add_column :users, :github, :string
    add_column :users, :facebook, :string
  end
end
