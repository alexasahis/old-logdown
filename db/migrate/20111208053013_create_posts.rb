class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.text :excerpt
      t.integer :blog_id
      t.integer :user_id
      t.boolean :no_header, :default => false
      t.boolean :meta, :default => true
      t.boolean :enable_comment, :default => true
      t.boolean :enable_sharing, :default => true
      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end
