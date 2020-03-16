ActiveAdmin.register User do
  permit_params :email, :mobile

  actions :all, except: [:destroy]

  form do |f|
    f.semantic_errors
    f.actions
    f.inputs do
      f.input :email
      f.input :mobile
    end
  end

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
