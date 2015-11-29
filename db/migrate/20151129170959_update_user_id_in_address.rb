class UpdateUserIdInAddress < ActiveRecord::Migration
  def change
  	change_column :addresses, :user_id, :integer
  end
end
