# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

user = User.new(:login => "xdite", :screen_name => "xdite")
user.password = "123456"
user.password_confirmation = "123456"
user.email = "xuite.joke@gmail.com"
#user.is_admin =  true
user.save!

blog = user.blog

blog.disqus_short_name = "xditelogdown"
blog.save!

post = user.posts.build(:title => "Post 1", :content => "Post 1 content", :published_at => Time.now, :aasm_state => "published")

post2 = user.posts.build(:title => "Post 2", :content => "Post 2 content", :published_at => Time.now)
post.save!

post2.save!
