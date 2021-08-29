class Post < ApplicationRecord
  validates :title, presence: true

  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :finders, :history]

  def slug_candidates
    [
      :title,
      [:title, :content]
    ]
  end

  def should_generate_new_friendly_id?
    title_changed?
  end
end
