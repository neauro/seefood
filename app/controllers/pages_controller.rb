class PagesController < ApplicationController
  def home
  end

  # given lat/lng coordinates
  # returns nearby restaurants in database
  # todo: should actually return URLs of top menu items
  #       of nearby restaurants
  def get_nearby_food_pictures
    if params[:lat] and params[:lng]
      @restaurants = Restaurant.all
      # @buildings = Building.find( :all, :conditions => [ 'name LIKE ?', '%' + params[:q].downcase + '%'], :limit =&gt; 20)
      
    end

    render :json => @restaurants
  end

end
