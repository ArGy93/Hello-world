class Round < ApplicationRecord
  include AASM
  include RoundRepository

  has_many :tickets
  has_one :round_additional
  belongs_to :win_ticket, class_name: 'Ticket', foreign_key: 'win_ticket_id', optional: true

  validates :tickets_amount, presence: true
  validates :price, numericality: {minimum: 1000}
  validates :image, presence: true
  validates :description, presence: true

  mount_uploader :image, RoundImageUploader

  aasm do
    state :new, :initial => true
    state :active
    state :finished
    state :completed

    event :activate do
      transitions :from => :new, :to => :active
    end

    event :finish, after: :after_complete do
      transitions :from => :active, :to => :finished
    end

    event :complete do
      transitions :from => :finished, :to => :completed
    end
  end

  private

  def after_complete
    Rounds::AfterCompleteService.perform(self)
  end
end
