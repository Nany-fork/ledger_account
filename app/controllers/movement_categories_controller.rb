class MovementCategoriesController < ApplicationController
  before_action :set_movement_category, only: %i[ show edit update destroy ]
  after_action :authenticate_user!
  def show
    @movement_categories = MovementCategory.select(:id,:name).where(movement_type_id:params[:id])
    render json: @movement_categories
  end

  def new
    @movement_category = MovementCategory.new
  end

  def edit
  end

  def create
    @movement_category = MovementCategory.new(movement_category_params)

    respond_to do |format|
      if @movement_category.save
        format.html { redirect_to movement_category_url(@movement_category), notice: "Movement category was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @movement_category.update(movement_category_params)
        format.html { redirect_to movement_category_url(@movement_category), notice: "Movement category was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @movement_category.destroy

    respond_to do |format|
      format.html { redirect_to movement_categories_url, notice: "Movement category was successfully destroyed." }
    end
  end

  private
    def set_movement_category
      @movement_category = MovementCategory.find(params[:id])
    end


    def movement_category_params
      params.require(:movement_category).permit(:name, :movement_type_id)
    end
end
