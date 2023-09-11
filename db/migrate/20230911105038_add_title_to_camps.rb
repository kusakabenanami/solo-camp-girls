class AddTitleToCamps < ActiveRecord::Migration[6.1]
  def change
    add_column :camps, :title, :string,null:false
  end
end
