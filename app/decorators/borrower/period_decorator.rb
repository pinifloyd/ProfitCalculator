class Borrower::PeriodDecorator < Draper::Decorator

  delegate_all

  def summ
    h.number_to_currency object.summ, precision: 2
  end

  def state
    h.t "states.period.#{object.state}"
  end

  def state_events_for_select
    object.class.state_machine.events.map do |event|
      [h.t("events.period.#{event.name}"), event.name]
    end
  end

end
