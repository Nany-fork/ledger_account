class MovementsController < ApplicationController
  before_action :set_movement, only: %i[ show edit update destroy ]
  after_action :authenticate_user!
  # GET /movements or /movements.json
  def index
    # @movements = Movement.all
    account = current_user.account
    @movements = Movement.where(account_id: account.id)
    @account_balance = current_user.account.balance
    # @movement_type = MovementType.where(id: @movements.movement_category_id)
  end

  # GET /movements/1 or /movements/1.json
  def show
  end

  # GET /movements/new
  def new
    @movement = Movement.new
  end

  # GET /movements/1/edit
  def edit
  end

  # POST /movements or /movements.json
  def create
    if params[:movement][:movement_type_id] == '1'
       account = current_user.account
       account.update(balance: account.balance + params[:movement][:ammount].to_i )
    end
    @movement = Movement.new(movement_params.merge(account: current_user.account))
    # @movement.account = current_user.account
    respond_to do |format|
      if @movement.save
        format.html { redirect_to :root, notice: "Movement was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movements/1 or /movements/1.json
  def update
    respond_to do |format|
      if @movement.update(movement_params)
        format.html { redirect_to movement_url(@movement), notice: "Movement was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movements/1 or /movements/1.json
  def destroy
    @movement.destroy

    respond_to do |format|
      format.html { redirect_to movements_url, notice: "Movement was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movement
      @movement = Movement.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def movement_params
      params.require(:movement).permit(:name, :description, :date, :ammount, :category, :movement_type_id )
    end
end
