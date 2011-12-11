class Blog < ActiveRecord::Base
  belongs_to :user
  has_many :posts
  
  def titlecase
    false
  end
  
  def disqus_short_name
    "#TODO"
  end
  
  def disqus_show_comment_count
    "#TODO"
  end
  
  def custom_asides
  	false
  	# TODO
  end
  
  def recent_posts_limit
    5
    # TODO
  end
  
  def recent_posts
    posts.published.recent.limit(recent_posts_limit)
  end 
  
  def has_custom_post_sidebar?
    false # TODO
  end
  
end
