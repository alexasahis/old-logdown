class Blog < ActiveRecord::Base
  belongs_to :user
  has_many :posts
  
  
  def titlecase
    false
  end
end
