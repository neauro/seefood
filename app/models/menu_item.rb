class MenuItem < ActiveRecord::Base
  belongs_to :restaurant
  validates :name, :presence => true
  validates :price, :presence => true
  validates :restaurant, :presence => true
end
