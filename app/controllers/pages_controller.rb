class PagesController < ApplicationController
  
  def welcome
    unless current_user.blank?
      redirect_to posts_path 
      drop_breadcrumb("Hello")
      return
    end
  end

end
