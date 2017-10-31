module ApplicationHelper

  def localize_date(date)
    I18n.l date, format: "%d.%m.%Y" if date.present?
  end

end
