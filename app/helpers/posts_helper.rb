module PostsHelper
  def titlecase(post)
    post.title
    # TODO
  end
  
  def render_post_title(post)
    if @site.titlecase
      title = titlecase(post)
    else
      title = post.title
    end
    
    return link_to(title, blog_post_path(@site, post))
  end
end
