require 'action_view'
class Cat < ApplicationRecord
  include ActionView::Helpers::DateHelper
  validates :birth_date, :name, :color, :sex, presence: true
  validates :sex, inclusion: %w(M F)
  validates :color, inclusion: %w(black white grey brown)

  def age
    time_ago_in_words(birth_date)
  end
end
