class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.integer :user_id
      t.boolean :active
      t.string :image_uid
      t.string :image_name
      t.timestamps
    end
  end
end
