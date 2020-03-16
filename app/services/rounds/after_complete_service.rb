module Rounds
  class AfterCompleteService < BaseService
    alias round params

    def perform
      send_sms
      setup_cyclic
    end

    private

    def send_sms
      Sms.send(round.win_ticket.user.mobile, I18n.t('sms.winner', host: ENV['HOST_NAME']))
    end

    def setup_cyclic
      if round.cyclic
        r = Round.create name: round.name,
                         price: round.price,
                         description: round.description,
                         image: round.image,
                         tickets_amount: round.tickets_amount,
                         cyclic: round.cyclic
        r.activate!
      end
    end
  end
end