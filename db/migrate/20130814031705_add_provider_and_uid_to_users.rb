class AddProviderAndUidToUsers < ActiveRecord::Migration
  def change
    add_column :users, :provder, :string
    add_column :users, :uid, :string
  end
end
