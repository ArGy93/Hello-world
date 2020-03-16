ActiveAdmin.register_page "Cheats" do
  belongs_to :round

  content title: proc{ I18n.t("admin.cheats.tickets") } do
    columns do
      column do
        render 'admin/rounds/tickets_form'
      end
    end
  end

  page_action :add_tickets, method: :post do
    result = Rounds::CreateTicketsService.perform round_id: params[:round_id],
                                                 user_id: params[:ticket][:user_id]

    redirect_to admin_round_path(id: params[:round_id]), notice: result.success? ?
                                                                 "Tickets created" :
                                                                 "Error: #{result.errors.message}"
  end
end
