module PromoRepository
  extend ActiveSupport::Concern

  included do
    scope :referral, -> (ref)  { find_by ref: ref }
  end
end