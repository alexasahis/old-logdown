module ApplicationHelper

  def notice_message
    flash_messages = []

    flash.each do |type, message|
      type = :success if type == :notice
      text = content_tag(:div, link_to("x", "#", :class => "close") + content_tag(:p,message), :class => "alert-message #{type}", "data-alert" => "alert")
      flash_messages << text if message
    end

    flash_messages.join("\n").html_safe
  end
  
  def shorthand_url(input)
    # From octopress_filters.rb
    input.gsub /(https?:\/\/)(\S+)/ do
      $2
    end
  end

end
