module Shared::Adminlte::IconsHelper

  ###
  # FontAwesome icons
  #----------------------------------------------------------------------------
  def fa_icon(icon)
    content_tag :i, nil, class: "fa fa-#{icon}"
  end

end
