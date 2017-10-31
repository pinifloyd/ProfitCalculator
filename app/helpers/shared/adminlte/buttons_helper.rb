module Shared::Adminlte::ButtonsHelper

  ###
  # Return button classes
  #
  # @option options class: 'btn-class-one btn-class-two'
  # @option options class: ['btn-class-one', 'btn-class-two']
  # @option options size: 'sm'
  # @option options type: 'default'
  # @option options class: '...', size: '...', type: '...'
  #------------------------------------------------------------------------------------------------
  def bs_btn_class(*args)
    options = args.extract_options!

    classes = case options[:class]
              when String
                options[:class].split
              when Array
                options[:class]
              else
                []
              end | %w(btn)

    classes |= ["btn-#{options[:size] || 'sm'}"]
    classes |= ["btn-#{options[:type] || 'default'}"]
  end

  ###
  # Return button content
  #
  # @option options type: 'icon'|'text'|'full'
  # @option options icon: 'icon'
  # @option options text: 'text'
  #------------------------------------------------------------------------------------------------
  def bs_btn_content(*args)
    options = args.extract_options!

    options[:type] ||= :icon

    options[:icon]  = fa_icon options[:icon]
    options[:space] = '&nbsp;'.html_safe

    case options[:type]
    when :icon then options[:icon]
    when :text then options[:text]
    when :full then safe_join([
      options[:icon], options[:space], options[:text]
    ])
    end
  end

  ###
  # Return link styled as button with content as icon and/or text
  #
  # @option options path
  # @option options path: 'path'
  # @option options type: 'link'|'button'
  #
  # @param param args[0] is a options[:path] or '#'
  #
  # @option options content: { ... }
  # @see #bs_btn_content
  #
  # @option options btn: { ... }
  # @see #bs_btn_class
  #
  # It can get any other standard link_to options
  #------------------------------------------------------------------------------------------------
  def bs_button(*args)
    options = args.extract_options!

    path            = args[0] || options[:path] || '#'
    content         = bs_btn_content options.delete(:content)
    options[:class] = bs_btn_class options.delete(:btn)

    case options.delete(:type) || :link
    when :link
      link_to content, path, options
    when :button
      button_tag content, options
    end
  end

  ###
  # Build save button as link with icon and/or text
  #
  # @option options content: { ... }
  # @see #bs_btn_content
  #
  # @option options btn: { ... }
  # @see #bs_btn_class
  #
  # It can get any other standard link_to options
  #------------------------------------------------------------------------------------------------
  def bs_button_save(*args)
    options = args.extract_options!

    options[:content] = {
      type: :icon,
      icon: :check,
      text: t('buttons.save')
    }.deep_merge(
      options.delete(:content) || {}
    )

    bs_button options
  end

  ###
  # Build back link styled as button with content as icon and/or text
  #
  # @option options path
  # @option options path: 'path'
  #
  # @param param args[0] is a options[:path] or 'javascript:history.back()'
  #
  # @option options content: { ... }
  # @see #bs_btn_content
  #
  # @option options btn: { ... }
  # @see #bs_btn_class
  #
  # It can get any other standard link_to options
  #------------------------------------------------------------------------------------------------
  def bs_button_back(*args)
    options = args.extract_options!

    path = args[0] || options.delete(:path) || 'javascript:history.back()'

    options[:content] = {
      type: :icon,
      icon: :'arrow-left',
      text: t('buttons.back')
    }.deep_merge(
      options.delete(:content) || {}
    )

    bs_button path, options
  end

  ###
  # Build destroy link styled as button with content as icon and/or text
  #
  # @option options path
  # @option options path: 'path'
  #
  # @param param args[0] is a options[:path]
  #
  # @option options content: { ... }
  # @see #bs_btn_content
  #
  # @option options btn: { ... }
  # @see #bs_btn_class
  #
  # It can get any other standard link_to options
  #------------------------------------------------------------------------------------------------
  def bs_button_destroy(*args)
    options = args.extract_options!

    path = args[0] || options.delete(:path)

    options[:content] = {
      type: :icon,
      icon: :'trash-o',
      text: t('buttons.destroy')
    }.deep_merge(
      options.delete(:content) || {}
    )

    options[:method] = :delete

    bs_button path, options
  end

  ###
  # Build show link styled as button with content as icon and/or text
  #
  # @option options path
  # @option options path: 'path'
  #
  # @param param args[0] is a options[:path]
  #
  # @option options content: { ... }
  # @see #bs_btn_content
  #
  # @option options btn: { ... }
  # @see #bs_btn_class
  #
  # It can get any other standard link_to options
  #------------------------------------------------------------------------------------------------
  def bs_button_show(*args)
    options = args.extract_options!

    path = args[0] || options.delete(:path)

    options[:content] = {
      type: :icon,
      icon: :eye,
      text: t('buttons.show')
    }.deep_merge(
      options.delete(:content) || {}
    )

    bs_button path, options
  end

  ###
  # Build edit link styled as button with content as icon and/or text
  #
  # @option options path
  # @option options path: 'path'
  #
  # @param param args[0] is a options[:path]
  #
  # @option options content: { ... }
  # @see #bs_btn_content
  #
  # @option options btn: { ... }
  # @see #bs_btn_class
  #
  # It can get any other standard link_to options
  #------------------------------------------------------------------------------------------------
  def bs_button_edit(*args)
    options = args.extract_options!

    path = args[0] || options.delete(:path)

    options[:content] = {
      type: :icon,
      icon: :edit,
      text: t('buttons.edit')
    }.deep_merge(
      options.delete(:content) || {}
    )

    bs_button path, options
  end

  ###
  # Build remove link styled as button with content as icon and/or text
  #
  # @option options path
  # @option options path: 'path'
  #
  # @param param args[0] is a options[:path]
  #
  # @option options content: { ... }
  # @see #bs_btn_content
  #
  # @option options btn: { ... }
  # @see #bs_btn_class
  #
  # It can get any other standard link_to options
  #------------------------------------------------------------------------------------------------
  def bs_button_remove(*args)
    options = args.extract_options!

    path = args[0] || options.delete(:path)

    options[:content] = {
      type: :icon,
      icon: :minus,
      text: t('buttons.remove')
    }.deep_merge(
      options.delete(:content) || {}
    )

    bs_button path, options
  end

  ###
  # Build add link styled as button with content as icon and/or text
  #
  # @option options path
  # @option options path: 'path'
  #
  # @param param args[0] is a options[:path]
  #
  # @option options content: { ... }
  # @see #bs_btn_content
  #
  # @option options btn: { ... }
  # @see #bs_btn_class
  #
  # It can get any other standard link_to options
  #------------------------------------------------------------------------------------------------
  def bs_button_add(*args)
    options = args.extract_options!

    path = args[0] || options.delete(:path)

    options[:content] = {
      type: :icon,
      icon: :plus,
      text: t('buttons.add')
    }.deep_merge(
      options.delete(:content) || {}
    )

    bs_button path, options
  end

  ###
  # Build search link styled as button with content as icon and/or text
  #
  # @option options path
  # @option options path: 'path'
  #
  # @param param args[0] is a options[:path]
  #
  # @option options content: { ... }
  # @see #bs_btn_content
  #
  # @option options btn: { ... }
  # @see #bs_btn_class
  #
  # It can get any other standard link_to options
  #------------------------------------------------------------------------------------------------
  def bs_button_search(*args)
    options = args.extract_options!

    path = args[0] || options.delete(:path)

    options[:content] = {
      type: :icon,
      icon: :search,
      text: t('buttons.search')
    }.deep_merge(
      options.delete(:content) || {}
    )

    bs_button path, options
  end

end
