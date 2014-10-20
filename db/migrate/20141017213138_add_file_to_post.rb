class AddFileToPost < ActiveRecord::Migration
  def change
    add_column :posts, :file_uid,  :string
    add_column :posts, :file_name, :string
  end
end
