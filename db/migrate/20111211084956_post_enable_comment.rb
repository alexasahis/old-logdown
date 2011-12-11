class PostEnableComment < ActiveRecord::Migration
  def up
     add_column :posts, :enable_comment, :boolean, :default => true
  end

  def down
     remove_column :posts, :enable_comment
  end
end
