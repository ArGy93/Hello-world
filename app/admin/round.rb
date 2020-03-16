ActiveAdmin.register Round do

  permit_params :name, :price, :description, :image, :tickets_amount, :cyclic, :card_type

  actions :all, except: [:destroy]

  decorate_with RoundDecorator

  form decorate: true do |f|
    f.semantic_errors
    f.inputs do
      f.input :name
      f.input :price, as: :number
      f.input :tickets_amount, as: :number
      f.input :ticket_price, input_html: {disabled: true}
      f.input :description, as: :ckeditor
      f.input :image, as: :file, hint: f.object.image.present? ? image_tag(f.object.image.url(:thumb))
                                                               : content_tag(:span, "no image yet")
      f.input :image_cache, :as => :hidden
      f.input :card_type, :as => :select, collection: %w(left right center)
      f.input :cyclic
    end
    f.actions
  end

  show do
    panel 'Round' do
      attributes_table_for round do
        row :id
        row :name
        row :description
        row :price
        row :ticket_price do
          round.price / round.tickets_amount
        end
        row :tickets_amount
        row :tickets_sales do
          round.tickets.size
        end
        row :ticket
        row :aasm_state
        row :created_at
        row :image do
          image_tag round.image.url(:thumb)
        end
        row :cyclic
      end
    end
  end

  action_item :activate, only: :show, if: proc{ round.aasm_state == 'new' } do
    link_to I18n.t('admin.buttons.start'), "/admin/rounds/#{round.id}/activate", data: { confirm: I18n.t('admin.messages.start') }
  end

  member_action :activate, method: :get do
    item = Round.find params[:id]
    begin
      item.activate!
      redirect_to admin_round_path(item), notice: I18n.t('admin.notice.started')
    rescue Exception => ex
      redirect_to admin_round_path(item), notice: ex.message
    end
  end

  action_item :complete, only: :show, if: proc{ round.aasm_state == 'finished' } do
    link_to I18n.t('admin.buttons.stop'), new_admin_round_round_additional_path(round), data: { confirm: I18n.t('admin.messages.stop') }
  end

  action_item :additional, only: :show, if: proc{ round.aasm_state == 'completed' } do
    link_to I18n.t('admin.buttons.additional'), admin_round_round_additional_path(round, round.round_additional)
  end

  action_item :tickets, only: :show, if: proc{ params[:cheats] } do
    link_to I18n.t('admin.cheats.tickets'), admin_round_cheats_path(round)
  end

  action_item :compute_winner, only: :index, if: proc{ params[:cheats] } do
    link_to I18n.t('admin.cheats.compute'), compute_winner_admin_rounds_path
  end

  collection_action :compute_winner, method: :get do
    ComputeRoundTask.perform
    redirect_to admin_rounds_path, notice: 'Rounds computed'
  end
end
