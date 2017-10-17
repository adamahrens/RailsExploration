module TimeOffsHelper
  def status_span(time_off)
    text = time_off.status.titleize
    if time_off.approved?
      content_tag(:span, text, class: 'text-success')
    elsif time_off.rejected?
      content_tag(:span, text, class: 'text-danger')
    else
      content_tag(:span, text, class: 'text-primary')
    end
  end
end
