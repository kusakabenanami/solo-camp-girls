class AddCampIdToFavorites < ActiveRecord::Migration[6.1]
  def change
    add_column :favorites, :camp_id, :integer
  end
end
