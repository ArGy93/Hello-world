class User < ApplicationRecord

  has_many :tickets

  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :authentication_keys => [:mobile]

  validates :mobile, uniqueness: true, format: { with: /\+\d{11}/ }
  # after_create :check_referral

  def self.make(mobile, ref)
    user = User.find_by(mobile: mobile)
    password = SecureRandom.hex(4)
    if user.nil?
      user = create mobile: mobile, password: password, password_confirmation: password, ref: ref, email: password
    else
      update password: password, password_confirmation: password
    end
    Sms.send(mobile, password)
  end

  def email_required?
    false
  end

  def email_changed?
    false
  end

  def to_s
    mobile
  end

  def display_name
    to_s
  end

  private

  def create_referral
    Users::Referral.perform self
  end
end
