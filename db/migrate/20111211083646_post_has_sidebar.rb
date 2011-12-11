class PostHasSidebar < ActiveRecord::Migration
  def up
    add_column :posts, :has_sidebar, :boolean, :default => true
  end

  def down
    remove_column :posts, :has_sidebar
  end
end
