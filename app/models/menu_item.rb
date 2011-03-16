class MenuItem < ActiveRecord::Base
  belongs_to :restaurant
  has_many :reviews, :inverse_of => :menu_item, :dependent => :destroy
  accepts_nested_attributes_for :reviews
  validates :name, :presence => true
  validates :price, :presence => true, :numericality => true
  validates :restaurant, :presence => true
end
