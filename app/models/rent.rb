class Rent < ApplicationRecord
  has_many :line_items
  belongs_to :user
end
