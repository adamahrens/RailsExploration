module PostsHelper
  def span_for_status(status)
    case status
    when 'approved'
      return content_tag(:span, status.capitalize, class: 'label label-success')
    when 'rejected'
      return content_tag(:span, status.capitalize, class: 'label label-danger')
    else
      return content_tag(:span, status.capitalize, class: 'label label-primary')
    end
  end
end
