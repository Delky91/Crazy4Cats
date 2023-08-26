class AddConstraintsToComments < ActiveRecord::Migration[7.0]
  def change
    change_column :comments, :author, :string, limit: 20
    change_column :comments, :content, :text, null: false, limit: 300
  end
end
