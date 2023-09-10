class AddUserIdToCampComments < ActiveRecord::Migration[6.1]
  def change
    add_column :camp_comments, :user_id, :integer
  end
end
