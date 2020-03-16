module Users
  class Referral
    attr_accessor :user

    def self.perform(*args)
      new(*args).perform
    end

    protected

    def initialize(user)
      @user = user
    end

    def perform
      promo = Promo.referral user.ref
      if promo.persist?
        Thread.new do
          Rails.application.executor.wrap do
            promo.name.constantize.send(:perform, user, promo)
          end
        end
      end
    end
  end
end