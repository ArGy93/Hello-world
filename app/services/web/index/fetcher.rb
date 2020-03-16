module Web
  module Index
    class Fetcher < BaseService

      def perform
        data = {}
        data[:rounds] = fetch_rounds
        data[:recent] = recent_round
        success_result data: data
      rescue StandartError => ex
        error_result errors: ex
      end

      private

      def fetch_rounds
        Round.active
      end

      def recent_round
        Round.for_history.last
      end
    end
  end
end