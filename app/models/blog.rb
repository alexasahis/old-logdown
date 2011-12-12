class Blog < ActiveRecord::Base
  belongs_to :user
  has_many :posts


  def recent_posts
    posts.published.recent.limit(recent_posts_limit)
  end 
  
  def has_custom_post_sidebar?
    has_custom_sidebar
    false # TODO
  end

end
