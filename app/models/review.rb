class Review < ActiveRecord::Base
  has_attached_file :picture, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  belongs_to :menu_item, :inverse_of => :reviews
  validates :picture, :presence => true
  validates :stars, :presence => true, :numericality => true, :inclusion => {:in => [1,2,3,4,5]}
  validates :description, :presence => true
  validates :menu_item, :presence => true
end
