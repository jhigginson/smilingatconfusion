class RemoveProvderAndAddProviderToUsers < ActiveRecord::Migration
  def change
    remove_column :users, :provder, :string
    add_column :users, :provider, :string
  end
end
