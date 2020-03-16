ActiveAdmin.register Promo do

  permit_params :name, :owner, :ref

  form do |f|
    f.semantic_errors # shows errors on :base

    f.inputs do          # builds an input field for every attribute
      f.input :name, as: :select, collection: Services::Promos.constants.select {|c| Services::Promos.const_get(c).is_a? Class}.map(&:to_s)
      f.input :owner
      f.input :ref
    end

    f.actions         # adds the 'Submit' and 'Cancel' buttons
  end

end
