class AddBodyToCamps < ActiveRecord::Migration[6.1]
  def change
    add_column :camps, :body, :text
  end
end
