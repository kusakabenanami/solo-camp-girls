class AddIsWithdrawalToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :is_withdrawal, :boolean
  end
end
