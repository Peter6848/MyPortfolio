class Portfolio < ApplicationRecord
  validates :title, :body, :main_image, :thumb_image, presence: true

  # def self.react
  #   where(subtitle: "React")
  # end
  scope :ruby_on_rails, -> { where(subtitle: "Ruby on Rails") }
  scope :react, -> { where(subtitle: "React") }

  after_initialize :set_defaults

  def set_defaults
    self.main_image ||= "http://via.placeholder.com/600x400"
    self.thumb_image ||= "http://via.placeholder.com/350x200"
  end
end
