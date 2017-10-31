module Shared::Adminlte::FormHelper

  # AdminLTE form helper
  #----------------------------------------------------------------------------
  def form_for(resource, options = {}, &block)
    options[:builder] ||= LTEFormBuilder
    super resource, options, &block
  end

end
