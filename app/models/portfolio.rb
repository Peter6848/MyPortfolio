class Portfolio < ApplicationRecord
  has_many :technologies
  include Placeholder
  accepts_nested_attributes_for :technologies,
                                reject_if: lambda { |attrs| attrs['name'].blank? }

  validates :title, :body, :main_image, :thumb_image, presence: true

  scope :ruby_on_rails, -> { where(subtitle: "Ruby on Rails") }
  scope :react, -> { where(subtitle: "React") }

  after_initialize :set_defaults

  def set_defaults
    self.main_image ||= Placeholder.image_generator(height: '600', width: '400')
    self.thumb_image ||= Placeholder.image_generator(height: '350', width: '200')
  end

  def self.by_position
    order("position ASC")
  end
end
