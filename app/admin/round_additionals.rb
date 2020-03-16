ActiveAdmin.register RoundAdditional do
  belongs_to :round

  permit_params :address, :round_id, :extra, :name

  actions :all, except: [:destroy]

  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :round, input_html: {disabled: true}
      f.input :name
      f.input :address, as: :ckeditor
      f.input :extra, as: :ckeditor
    end
    f.actions
  end

  show do |info|
    panel 'Round' do
      attributes_table_for round do
        row :round
        row :name
        row :address do
          info.address.html_safe
        end
        row :extra do
          info.extra.html_safe
        end
        row :created_at
      end
    end
  end
end
