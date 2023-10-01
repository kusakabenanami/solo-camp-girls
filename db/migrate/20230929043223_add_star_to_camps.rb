class AddStarToCamps < ActiveRecord::Migration[6.1]
  def change
    add_column :camps, :star, :string
  end
end
