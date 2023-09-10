class AddCampIdToCampComments < ActiveRecord::Migration[6.1]
  def change
    add_column :camp_comments, :camp_id, :integer
  end
end
