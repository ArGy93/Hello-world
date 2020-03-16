class AddPartnerPage < ActiveRecord::Migration[5.1]
  def change
    StaticPage.create! title: 'Партнерская программа', slug: 'partner', system: true, draft: 'false'
  end
end
