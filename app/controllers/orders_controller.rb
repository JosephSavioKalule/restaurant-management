class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :set_table, only: [:new, :create]

  # GET tables/:table_id/orders
  # GET tables/:table_id/orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @items = @order.items
  end

  # GET tables/:table_id/orders/new
  def new
    @order = @table.orders.build
  end

  # GET /orders/1/edit
  def edit
  end

  # POST tables/:table_id/orders
  # POST tables/:table_id/orders.json
  def create
    @order = @table.orders.build(order_params)

    respond_to do |format|
      if @order.save
        flash[:success] = "Order was successfully created."
        format.html { redirect_to order_path(@order) }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH /orders/1
  # PATCH /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        flash[:success] = "Order was successfully updated."
        format.html { redirect_to order_path(@order) }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      flash[:success] = "Order was successfully destroyed."
      format.html { redirect_to table_orders_path(@order.table_id) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end
    
    def set_table
      @table = Table.find(params[:table_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:is_paid)
    end
    
end
