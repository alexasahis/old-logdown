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
end
