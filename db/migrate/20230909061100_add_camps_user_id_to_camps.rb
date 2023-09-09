class AddCampsUserIdToCamps < ActiveRecord::Migration[6.1]
  def change
    add_column :camps, :user_id, :integer
  end
end
