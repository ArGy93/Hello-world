class StaticPage < ApplicationRecord

  after_save :check_draft

  scope :by_slug, ->(slug) { find_by(slug: slug)}

  def preview
    text[0..280]
  end

  private

  def check_draft
    if draft && draft_key.blank?
      update draft_key: SecureRandom.hex(4)
    end
  end

end
