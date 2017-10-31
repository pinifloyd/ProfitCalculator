module ApplicationHelper

  def localize_date(date, format = :general_date)
    return if date.blank?

    template =
      case format.to_sym
        when :general_date then "%d.%m.%Y"
        when :l_year_month then "%Y: %B"
        else "%d.%m.%Y"
      end

    I18n.l date, format: template
  end

end
