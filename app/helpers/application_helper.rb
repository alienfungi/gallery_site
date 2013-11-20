module ApplicationHelper

  def full_title(page_title = '')
    page_title = page_heading(page_title)
    base_title = gallery_name
    if page_title.blank?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def page_heading(page_title = '')
    page_title.blank? ? request.fullpath.split('/').last : page_title
  end

  def gallery_name
    case session[:location_id]
    when 'key_west' then 'James Coleman Gallery Key West'
    when 'st_augustine' then 'James Coleman Signature Gallery'
    else 'Art Gallery'
    end
  end

  def flash_class(type)
    "alert-box " + case type
      when :success then "success"
      when :notice then ""
      when :alert, :error then "alert"
      else "invalid-type"
      end
  end

  def format_time(time)
    formatted_time = if(cookies["browser.timezone"])
      time.in_time_zone(cookies["browser.timezone"]).strftime("%b %d, %Y %I:%M %P")
    else
      time.strftime("%b %d, %Y %I:%M %P %Z")
    end
    formatted_time.gsub(/0(\d:\d\d)/) { $1 }
  end

  def header_links
    [
      header_hash("Home", location_home_path(session[:location_id]), 'home'),
      header_hash("Gallery", location_gallery_path(session[:location_id]), 'gallery'),
      header_hash("Artist Shows", location_shows_path(session[:location_id]), 'shows'),
      header_hash("About Us", location_about_path(session[:location_id]), 'about'),
      header_hash("Contact Us", location_contact_path(session[:location_id]), 'contact')
    ]
  end

private

  def header_hash(text, path, id, method = false)
    {
      text: text,
      path: path,
      id: "header_#{id}"
    }.tap { |hash| hash[:method] = method if method }
  end

end
