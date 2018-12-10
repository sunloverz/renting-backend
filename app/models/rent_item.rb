class RentItem < ApplicationRecord
  belongs_to :rent
  belongs_to :equipment
end
