class CreateAttachedImages < ActiveRecord::Migration
  def self.up
    create_table :attached_images do |t|
      t.references :user
      t.column  :processing, :boolean
      t.column  :image_file_name, :string
      t.column  :image_content_type, :string
      t.column  :image_file_size, :integer
      t.column  :image_updated_at, :datetime
      t.timestamps
    end

    add_index :attached_images, :user_id
    add_index "attached_images", "image_content_type"
  end

  def self.down
    drop_table :attached_images
  end
end
