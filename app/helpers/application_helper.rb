module ApplicationHelper

  def nav_link title, path
    content_tag :li, :class => ("active" if request.path.eql?(path)) do
      link_to title, path
    end
  end

end
