class AddUserGroupToUsers < ActiveRecord::Migration
  def change
    add_column :users, :usergroup, :integer
  end
end
