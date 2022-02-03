class MovementTypesController < ApplicationController
  before_action :set_movement_type, only: %i[ show edit update destroy ]

  # GET /movement_types or /movement_types.json
  def index
    @movement_types = MovementType.all
  end

  # GET /movement_types/1 or /movement_types/1.json
  def show
  end

  # GET /movement_types/new
  def new
    @movement_type = MovementType.new
  end

  # GET /movement_types/1/edit
  def edit
  end

  # POST /movement_types or /movement_types.json
  def create
    @movement_type = MovementType.new(movement_type_params)

    respond_to do |format|
      if @movement_type.save
        format.html { redirect_to movement_type_url(@movement_type), notice: "Movement type was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movement_types/1 or /movement_types/1.json
  def update
    respond_to do |format|
      if @movement_type.update(movement_type_params)
        format.html { redirect_to movement_type_url(@movement_type), notice: "Movement type was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movement_types/1 or /movement_types/1.json
  def destroy
    @movement_type.destroy

    respond_to do |format|
      format.html { redirect_to movement_types_url, notice: "Movement type was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movement_type
      @movement_type = MovementType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def movement_type_params
      params.require(:movement_type).permit(:name)
    end
end
