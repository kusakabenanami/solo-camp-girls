class CreateCampComments < ActiveRecord::Migration[6.1]
  def change
    create_table :camp_comments do |t|

      t.timestamps
    end
  end
end
