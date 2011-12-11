# == Schema Information
#
# Table name: posts
#
#  id           :integer(4)      not null, primary key
#  title        :string(255)
#  content      :text
#  blog_id      :integer(4)
#  user_id      :integer(4)
#  created_at   :datetime
#  updated_at   :datetime
#  aasm_state   :string(255)
#  published_at :datetime
#  permalink    :string(255)
#

class Post < ActiveRecord::Base
  

  belongs_to :blog
  belongs_to :user
  
  scope :published, where(:aasm_state => "published")
  
  before_create :set_blog

  after_create :create_title, :set_published_at
  

  include AASM
  aasm_initial_state :draft
  aasm_state :draft
  aasm_state :submitted
  aasm_state :published

  aasm_event :draft do
    transitions :to => :draft, :from => [:published, :submitted]
  end

  aasm_event :submit do
    transitions :to => :submitted, :from => [:draft, :published]
  end

  aasm_event :publish do
    transitions :to => :published, :from => [:draft, :submitted]
  end

  scope :recent, :order => "published_at DESC"

  def self.published(order_by = "published_at DESC")
    where(:aasm_state => "published").where(["published_at <= ?", Time.zone.now]).order("published_at DESC")
  end

  
  def set_blog
    self.blog_id = self.user.blog.id
  end
  
  def to_param
    unless permalink.blank?
      return "#{id}-#{permalink}"
    else
      return "#{id}"
    end
  end
  
  def create_title
    if title.blank?
      self.title = "Post-#{id}"
      self.save(:validate => false)
    end
  end
  
  def set_published_at
    self.published_at = DateTime.now
    self.save(:validate => false)
  end
  
  def is_published?
    aasm_state == 'published' && published_at <= Time.now
  end
  
  def is_scheduled?
    aasm_state == 'published' && published_at > Time.now
  end
  
  def url
    "/posts/#{id}"
    # TODO
  end

  def comments
    # TODO
  end
  
  def date
    # TODO
  end
  
  def data_formatted
    # TODO
  end
  
  def update
    # TODO
  end
  
  def updated_formatted
    # TODO
  end
end

