###
# Disable default error wrapper for html
#------------------------------------------------------------------------------
Rails.application.config.action_view.field_error_proc = proc { |html, instance| html.html_safe }
