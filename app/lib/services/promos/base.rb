module Services
  module Promos
    class Base
      class << self
        def perform(*args)
          new(*args).perform
        end
      end

      protected

      def initialize(user, promo)
        raise NotImplementedError.new '`initialize` must be implemented in child class'
      end

      def perform
        raise NotImplementedError.new '`perform` must be implemented in child class'
      end
    end
  end
end