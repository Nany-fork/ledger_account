class MovementCategoriesController < ApplicationController
  before_action :set_movement_category, only: %i[ show edit update destroy ]
  after_action :authenticate_user!
  # GET /movement_categories or /movement_categories.json
  def index
    @movement_categories = MovementCategory.all
  end

  # GET /movement_categories/1 or /movement_categories/1.json
  def show
  end

  # GET /movement_categories/new
  def new
    @movement_category = MovementCategory.new
  end

  # GET /movement_categories/1/edit
  def edit
  end

  # POST /movement_categories or /movement_categories.json
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

  # PATCH/PUT /movement_categories/1 or /movement_categories/1.json
  def update
    respond_to do |format|
      if @movement_category.update(movement_category_params)
        format.html { redirect_to movement_category_url(@movement_category), notice: "Movement category was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movement_categories/1 or /movement_categories/1.json
  def destroy
    @movement_category.destroy

    respond_to do |format|
      format.html { redirect_to movement_categories_url, notice: "Movement category was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movement_category
      @movement_category = MovementCategory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def movement_category_params
      params.require(:movement_category).permit(:name, :movement_type_id)
    end
end
