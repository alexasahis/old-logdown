class PostEnableSharing < ActiveRecord::Migration
  def up
    add_column :posts, :enable_sharing, :boolean, :default => true
  end

  def down
    remove_column :posts, :enable_sharing
  end
end
