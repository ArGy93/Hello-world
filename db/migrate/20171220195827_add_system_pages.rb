class AddSystemPages < ActiveRecord::Migration[5.1]
  def change
    add_column :static_pages, :title, :string
    StaticPage.create! title: 'О проекте', slug: 'about', system: true, draft: 'false'
    StaticPage.create! title: 'Вопросы и ответы', slug: 'faq', system: true, draft: 'false'
    StaticPage.create! title: 'Договор', slug: 'offerta', system: true, draft: 'false'
  end
end
