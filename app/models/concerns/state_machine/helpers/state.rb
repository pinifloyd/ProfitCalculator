module StateMachine::Helpers::State

  extend ActiveSupport::Concern

  # Instance methods
  #----------------------------------------------------------------------------
  def states
    self.class.states
  end

  def states_i18n
    self.class.states_i18n
  end

  def state_i18n
    self.class.state_i18n state
  end

  # Class methods
  #----------------------------------------------------------------------------
  module ClassMethods
    def states
      state_machine.states.map(&:name)
    end

    def states_i18n
      states.map { |state| [state_i18n(state), state] }
    end

    def state_i18n(state)
      I18n.t state, scope: [:states, name.split("::").last.downcase]
    end
  end

end
