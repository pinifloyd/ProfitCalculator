class LTEFormBuilder < ActionView::Helpers::FormBuilder

  delegate :errors, to: :@object

  delegate :content_tag, :safe_join, to: :@template

  def label(method, text = nil, options = {}, &block)
    text = safe_join([
      content_tag(:i, nil, class: 'fa fa-exclamation'),
      text ? text : @object.class.human_attribute_name(method)
    ], ' ') if errors[method].present?

    super method, text, options, &block
  end

  def chbox(method, options = {})
    klass = %w(checkbox)

    klass << 'has-error'     if errors[method].present?
    klass << options[:class] if options[:class].present?

    options[:class] = klass.flatten

    content_tag(:div, options) do
      content_tag(:label, options) { yield }
    end
  end

  def form_group(method, options = {})
    klass = %w(form-group)

    klass << 'has-error'     if errors[method].present?
    klass << options[:class] if options[:class].present?

    options[:class] = klass.flatten

    content_tag(:div, options) { yield }
  end

  def error_for(method)
    if errors[method].present?
      content_tag :span, errors[method].first, class: 'help-block'
    end
  end

  %i(
    text_field
    phone_field
    email_field
  ).each do |method_name|
    define_method method_name do |method, options = {}|
      klass = %w(form-control)

      klass << options[:class] if options[:class].present?

      options[:class] = klass.flatten

      super method, options
    end
  end

end
