class AddCommentToCampComments < ActiveRecord::Migration[6.1]
  def change
    add_column :camp_comments, :comment, :text
  end
end
