class MovementsController < ApplicationController
  before_action :set_movement, only: %i[ show edit update destroy ]
  after_action :authenticate_user!
 
  def index
    account = current_user.account
    @movements = account.movements
    @account_balance = current_user.account.balance
  end


  def show
  end

 
  def new
    @movement = Movement.new
  end


  def edit
  end

 
  def create
    # if params[:movement][:movement_type_id] == '1'
    #    account = current_user.account
    #    account.update(balance: account.balance + params[:movement][:ammount].to_i )
    # end
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

  def update
    respond_to do |format|
      if @movement.update(movement_params)
        format.html { redirect_to movement_url(@movement), notice: "Movement was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

 
  def destroy
    @movement.destroy

    respond_to do |format|
      format.html { redirect_to movements_url, notice: "Movement was successfully destroyed." }
    end
  end

  private

    def set_movement
      @movement = Movement.find(params[:id])
    end

    def movement_params
      params.require(:movement).permit(:name, :description, :date, :ammount, :category, :movement_type_id )
    end
end
