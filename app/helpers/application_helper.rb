module ApplicationHelper
  def full_page_title(title = '')
    base_title = 'Bababook'
    if title.empty?
      base_title
    else
      "#{title} | #{base_title}"
    end
  end
end
