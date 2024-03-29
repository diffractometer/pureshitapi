class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.string :file_uid
      t.string :file_name
      t.references :resource, polymorphic: true
    end
  end
end
