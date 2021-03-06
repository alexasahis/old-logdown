class CreateBlogs < ActiveRecord::Migration
  def self.up
    create_table :blogs do |t|
      t.integer :user_id
      t.string  :title
      t.string  :subtitle
      t.text    :description
      t.string  :excerpt_link_name, :default => "READ MORE"
      t.integer :recent_post_limit, :default => 5
      t.timestamps
    end
  end

  def self.down
    drop_table :blogs
  end
end
