module RoundRepository
  extend ActiveSupport::Concern

  included do
    scope :for_history, -> { where(aasm_state: %w(completed finished)) }
  end
end