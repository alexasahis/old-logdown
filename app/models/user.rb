class User < ActiveRecord::Base

  extend OmniauthCallbacks

  has_many :authorizations
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :login, :screen_name, :email, :password, :password_confirmation, :remember_me

  has_many :user_roles
  has_many :roles, :through => :user_roles

  has_one :blog
  has_many :posts
  has_many :attached_images

  after_create :create_blog


  protected

    def create_blog
      blog = self.build_blog(:title => "#{login}'s Blog", :subtitle => "Hello World")
      blog.save
    end
end
