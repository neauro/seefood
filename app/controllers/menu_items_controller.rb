class MenuItemsController < ApplicationController
  before_filter :get_restaurant
  before_filter :get_menu_item, :only => [:show, :edit, :update, :destroy]

  def get_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def get_menu_item
    @menu_item = MenuItem.find(params[:id])
  end

  # GET /menu_items
  # GET /menu_items.xml
  def index
    @menu_items = MenuItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @menu_items }
    end
  end

  # GET /menu_items/1
  # GET /menu_items/1.xml
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @menu_item }
    end
  end

  def new
    @menu_item = MenuItem.new(:restaurant => @restaurant)
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @menu_item }
    end
  end

  # GET /menu_items/1/edit
  def edit
  end

  # POST /menu_items
  # POST /menu_items.xml
  def create
    params[:menu_item][:restaurant] = @restaurant
    @menu_item = MenuItem.new(params[:menu_item])

    respond_to do |format|
      if @menu_item.save
        format.html { redirect_to([@restaurant, @menu_item], :notice => 'Menu item was successfully created.') }
        format.xml  { render :xml => [@restaurant, @menu_item], :status => :created, :location => @menu_item }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @menu_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /menu_items/1
  # PUT /menu_items/1.xml
  def update
    respond_to do |format|
      if @menu_item.update_attributes(params[:menu_item])
        format.html { redirect_to([@restaurant, @menu_item], :notice => 'Menu item was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @menu_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /menu_items/1
  # DELETE /menu_items/1.xml
  def destroy
    @menu_item.destroy

    respond_to do |format|
      format.html { redirect_to(restaurant_menu_items_url(@restaurant)) }
      format.xml  { head :ok }
    end
  end
end
