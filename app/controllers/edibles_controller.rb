class EdiblesController < ApplicationController
  before_action :set_edible, only:[:show, :edit, :update, :destroy]
  
  def index
    @edibles = Edible.all
  end

  def show
  end

  def new
    @edible = Edible.new
  end
  
  # This action uses POST parameters. They are most likely coming
  # from an HTML form which the user has submitted. The URL for
  # this RESTful request will be "/edibles", and the data will be
  # sent as part of the request body.
  def create
    @edible = Edible.new(edible_params)
    
    respond_to do |format|
      if @edible.save
        flash[:success] = "Edible was successfully created."
        format.html { redirect_to @edible }
        format.json { render :show, status: :created, location: @edible }
      else
        # This line overrides the default rendering behavior,
        # which would have been to render the "create" view.
        format.html { render :new }
        format.json { render json: @edible.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end
  
  def update
    respond_to do |format|
      if @edible.update(edible_params)
        flash[:success] = "Edible was successfully updated."
        format.html { redirect_to @edible }
        format.json { render :show, status: :ok, location: @edible }
      else
        format.html { render :edit }
        format.json { render json: @edible.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    if @edible.destroy
      flash[:success] = "Edible deleted!"
      redirect_to edibles_path
    else
      flash[:danger] = "Failed to delete edible!"
      redirect_to edible_path(@edible)
    end
  end
  
  private
  
    def set_edible
      @edible = Edible.find(params[:id])
    end
    
    def edible_params
      params.require(:edible).permit(:name, :description, :price)
    end
end
