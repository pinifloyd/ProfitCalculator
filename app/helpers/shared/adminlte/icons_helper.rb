module Shared::Adminlte::IconsHelper

  ###
  # Return icon
  #
  # @option options icon
  # @option options icon: 'icon'
  #
  # @param param args[0] is a options[:icon]
  #------------------------------------------------------------------------------------------------
  def fa_icon(*args)
    options = args.extract_options!

    icon = args[0] || options[:icon]

    content_tag :i, nil, class: "fa fa-#{icon}"
  end

end
