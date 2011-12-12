module BlogsHelper
  
  def render_blog_page_title(blog)
    content_tag(:title, blog.title )
  end
  
  
  def render_blog_description(blog)
    tag(:meta, {:name => "description", :content => blog.description})
  end
  
  def render_blog_author(blog)
    tag(:meta, :name => "author", :content => blog.user.login)
  end
  
  def render_blog_title(blog)
    link_to(blog.title, "/")
  end
  
  def render_blog_subtitle(blog)
    blog.subtitle
  end
  
  def render_blog_updated_time(blog)
    blog.updated_at.strftime("%Y") 
  end
  
  def render_blog_author_name(blog)
    blog.user.login
  end

end
