class Rent < ApplicationRecord
  include AASM
  has_many :rent_items
  has_many :equipments, through: :rent_items
  belongs_to :user
  belongs_to :customer

  aasm column: 'status' do
    state :reserved
    state :rented 
    state :expired 
    state :returned   

    event :return do
      transitions from: [:reserved, :rented], to: :returned
    end
   end
 end
