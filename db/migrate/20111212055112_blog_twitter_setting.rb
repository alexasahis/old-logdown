class BlogTwitterSetting < ActiveRecord::Migration
  def up
    add_column :blogs, :twitter_user                , :string
    add_column :blogs, :twitter_tweet_count         , :integer, :default => 4
    add_column :blogs, :twitter_show_replies        , :boolean, :default => false
    add_column :blogs, :enable_twitter_follow_button       , :boolean, :default => true
    add_column :blogs, :twitter_show_follower_count , :boolean, :default => false
    add_column :blogs, :enable_twitter_tweet_button        , :boolean, :default => true
  end

  def down
    remove_column :blogs, :twitter_user               
    remove_column :blogs, :twitter_tweet_count        
    remove_column :blogs, :twitter_show_replies       
    remove_column :blogs, :enable_twitter_follow_button      
    remove_column :blogs, :twitter_show_follower_count
    remove_column :blogs, :enable_twitter_tweet_button       
  end
end
