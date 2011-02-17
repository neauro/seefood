class Restaurant < ActiveRecord::Base
  has_many :menu_items, :dependent => :destroy # destroys menu_items if restaurant is destroyed
  validates :name, :presence => true
  validates :address, :presence => true
end
