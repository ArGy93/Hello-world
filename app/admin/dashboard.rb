ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      columns do
        column do
          panel "Finished rounds" do
            ul do
              Round.finished.map do |round|
                li link_to(round.name, admin_round_path(round))
              end
            end
          end
        end
      end
    end

    # Here is an example of a simple dashboard with columns and panels.
    #


    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end
