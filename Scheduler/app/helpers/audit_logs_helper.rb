module AuditLogsHelper
  def audit_status_span(audit_log)
    text = audit_log.status.titleize
    if audit_log.confirmed?
      content_tag(:span, text, class: 'badge badge-success')
    else
      content_tag(:span, text, class: 'badge badge-secondary')
    end
  end
end
