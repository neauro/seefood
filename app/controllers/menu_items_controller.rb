class MenuItemsController < ApplicationController
  before_filter :get_menu_item, :only => [:show, :edit, :update, :destroy]

  def get_menu_item
    @menu_item = MenuItem.find(params[:id])
  end

  def index
    @menu_items = MenuItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @menu_items }
    end
  end

  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @menu_item }
    end
  end

  def new
    @menu_item = MenuItem.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @menu_item }
    end
  end

  def edit
  end

  def create
    @menu_item = MenuItem.new(params[:menu_item])

    respond_to do |format|
      if @menu_item.save
        format.html { redirect_to(@menu_item, :notice => 'Menu item was successfully created.') }
        format.xml  { render :xml => @menu_item, :status => :created, :location => @menu_item }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @menu_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @menu_item.update_attributes(params[:menu_item])
        format.html { redirect_to(@menu_item, :notice => 'Menu item was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @menu_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    restaurant = @menu_item.restaurant
    @menu_item.destroy

    respond_to do |format|
      format.html { redirect_to(restaurant_path(restaurant)) }
      format.xml  { head :ok }
    end
  end
end
