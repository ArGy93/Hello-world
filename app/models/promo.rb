class Promo < ApplicationRecord
  include PromoRepository
  belongs_to :owner, class_name: 'User'
end
