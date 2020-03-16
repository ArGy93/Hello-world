module Web
  module Orders
    class CreateService < BaseService

      def perform
        order = Order.create permitted_params
        link = "https://megakassa.ru/#{order.id}"

        success_result data: link
      rescue StandartError => ex
        error_result errors: ex
      end

      private

      def permitted_params
        params.require(:order).permit(:round_id, :amount)
      end
    end
  end
end