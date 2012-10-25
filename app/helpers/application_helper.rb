module ApplicationHelper

  def nav_link title, path, options = {}
    content_tag :li, :class => ("active" if request.path.eql?(path)) do
      link_to title, path, options
    end
  end

  def tristateboolean bool
    case bool
    when true
      "Y"
    when false
      "N"
    when nil
      "-"
    end
  end

end
