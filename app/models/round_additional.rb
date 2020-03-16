class RoundAdditional < ApplicationRecord
  belongs_to :round

  after_create -> (this) { this.round.complete! }
end
