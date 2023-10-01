class AddUserToAdmins < ActiveRecord::Migration[6.1]
  def change
    add_column :admins, :user_name, :string
  end
end
