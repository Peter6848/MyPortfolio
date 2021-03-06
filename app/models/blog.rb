class Blog < ApplicationRecord
  enum status: { draft: 0, published: 1 }
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates :title, :body, presence: true

  has_many :comments, dependent: :destroy

  # belongs_to :topic

  def self.special_blogs
    all
  end

  def self.featured_blogs
    limit(2)
  end
end
