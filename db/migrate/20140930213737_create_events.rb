class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.text :body
      t.integer :user_id
      t.date :date
      t.time :time
      t.string :timezone
      t.string :address
      t.string :city
      t.string :zip
      t.string :region
      t.timestamps
    end
  end
end
