class CreateStaticPages < ActiveRecord::Migration[5.1]
  def change
    create_table :static_pages do |t|
      t.string :slug, index: true
      t.text :text
      t.boolean :draft, default: true
      t.boolean :system, default: false
      t.string :draft_key
      if Rails.env == 'production'
        t.string :tags, array: true, default: []
      else
        t.string :tags, array: true, default: '[]' # sqlite doesn't have array type
      end
      t.timestamps
    end
  end
end
