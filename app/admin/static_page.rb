ActiveAdmin.register StaticPage do
  permit_params :slug, :text, :title, :draft, :tags => []
  batch_action :destroy, false
  actions :all, except: :destroy

  index do
    id_column
    column :slug
    column :draft
    column :system
    column :tags
    actions
  end

  show do
    attributes_table do
      row :id
      row :title
      row :slug do
        link_to static_page.slug&.capitalize, "/pages/#{static_page.slug}"
      end
      row :draft
      row :draft_link do
        link_to 'Preview', "/pages/#{static_page.slug}?key=#{static_page.draft_key}" if static_page.draft
      end
      row :system
      row :preview do
        static_page.text&.html_safe
      end
      row :tags
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end

  form do|f|
    f.inputs do
      f.input :title
      f.input :slug
      f.input :text, as: :ckeditor
      f.input :draft
    end
    f.actions
  end

  action_item :remove, only: :show, if: -> { ! static_page.system } do
    link_to 'Remove', "/admin/static_pages/#{static_page.id}/remove"
  end

  member_action :remove, method: :get do
    page = StaticPage.find params[:id]
    if page.system
      redirect_to admin_static_page_path(page), notice: "System pages can't be removed"
    else
      page.destroy
      redirect_to admin_static_pages_path, notice: "Page removed"
    end
  end
end
