class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :update, :destroy]
  before_action :set_order, only: [:new, :create]
  after_action :update_total, only:[:create, :update, :destroy]
  
  # GET /orders/:order_id/items/new
  def new
    @order_items = @order.items
    @item = @order.items.build
  end
  
  # GET /items/:id/edit
  def edit
    @order = @item.order
    @order_items = @order.items
  end

  def create
    @item = @order.items.build(item_params)

    respond_to do |format|
      if @item.save
        flash[:success] = "Item was successfully added."
        format.html { redirect_to order_path(@order) }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # PATCH /items/1
  # PATCH /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        flash[:success] = "Item was successfully updated."
        format.html { redirect_to order_path(@item.order) }
        format.json { render :show, status: :ok, location: @item.order }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    # set order for the update_total callback:
    @order = @item.order
    @item.destroy
    respond_to do |format|
      flash[:success] = "Item was successfully removed."
      format.html { redirect_to order_path(@item.order) }
      format.json { head :no_content }
    end
  end
  
  private
  
    def set_item
      @item = Item.find(params[:id])
    end
    
    def set_order
      @order = Order.find(params[:order_id])
    end
    
    def item_params
      params.require(:item).permit(:quantity, :edible_id)
    end
    
    def update_total
      # after redirect to order_path:
      if @order.nil?
        @order = Item.find(params[:id]).order
      end
      
      @t = 0
      @order.items.each do |item|
        @t = @t + item.edible.price * item.quantity
      end
      @order.reload.total = @t
      @order.save
    end
end
