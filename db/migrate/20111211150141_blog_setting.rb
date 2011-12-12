class BlogSetting < ActiveRecord::Migration
  def up
    add_column :blogs, :custom_asides, :boolean, :default => false
    add_column :blogs, :disqus_short_name, :string
    add_column :blogs, :disqus_show_comment_count, :boolean, :default => true
    add_column :blogs, :titlecase, :boolean, :default => true
    add_column :blogs, :has_custom_sidebar, :boolean, :default => false
    add_column :blogs, :recent_posts_limit, :integer, :default => 5
    add_column :blogs, :enable_facebook_likes, :boolean, :default => true
    add_column :blogs, :google_analytics_tracking_id, :string
    add_column :blogs, :subscribe_email, :string
    add_column :blogs, :subscribe_rss, :string , :default => "/atom.xml"
    add_column :blogs, :simple_search, :string, :default => "http://google.com/search"
  end

  def down
    remove_column :blogs, :custom_asides
    remove_column :blogs, :disqus_short_name
    remove_column :blogs, :disqus_show_comment_count
    remove_column :blogs, :titlecase
    remove_column :blogs, :has_custom_sidebar
    remove_column :blogs, :recent_posts_limit
    remove_column :blogs, :enable_facebook_likes
    remove_column :blogs, :google_analytics_tracking_id
    remove_column :blogs, :subscribe_email
    remove_column :blogs, :subscribe_rss
    remove_column :blogs, :simple_search
  end
end
