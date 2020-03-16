class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :round, counter_cache: true

  after_create :create_guid

  scope :for_history, -> { eager_load(round: [:win_ticket]) }

  def create_guid
    update guid: SecureRandom.hex(10)
  end

  def to_s
    guid.upcase
  end

  def winner?
    id == round.win_ticket_id
  end
end
