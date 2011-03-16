class ReviewsController < ApplicationController
  before_filter :get_review, :only => [:show, :edit, :update, :destroy]

  def get_review
    @review = Review.find(params[:id])
  end

  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @review }
    end
  end

  def new
    @menu_item = MenuItem.find(params[:menu_item_id])
    @review = Review.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @review }
    end
  end

  def edit
    @menu_item = @review.menu_item
  end

  def create
    @menu_item = MenuItem.find(params[:review][:menu_item_id])
    @review = Review.new(params[:review])

    respond_to do |format|
      if @review.save
        format.html { redirect_to(@review, :notice => 'review was successfully created.') }
        format.xml  { render :xml => @review, :status => :created, :location => @review }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @review.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @review.update_attributes(params[:review])
        format.html { redirect_to(@review, :notice => 'review was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @review.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    menu_item = MenuItem.find(@review.menu_item_id)
    @review.destroy

    respond_to do |format|
      format.html { redirect_to(menu_item) }
      format.xml  { head :ok }
    end
  end
end
