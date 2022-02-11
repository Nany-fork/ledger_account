class MovementsController < ApplicationController
  before_action :set_movement, only: %i[ show edit update destroy ]
  after_action :authenticate_user!
 
  def index
    account = current_user.account
    @movements = account.movements
    @account_balance = current_user.account.balance
  end

  def graphics
    # current balance
    @account = current_user.account
     
    # movientos del usuario de la cuenta
    @movements = current_user.account.movements
    
    # movimientos del mes reccurente
    type_movement = MovementType.find_by(name:'Income')
    @income_for_amonth = @movements.where(movement_type_id:type_movement.id) 
    @total_of_mount = @income_for_amonth.where('extract(month from date) = ?', Date.today.strftime("%m")).sum(:ammount)

    # graficas
    @income_for_amonth_graph= @movements.where(movement_type_id:type_movement.id).group_by_month(:date).sum(:ammount)
    @category = @movements.group(:category).count
    @movements_graph = @movements.map do |x|
      { name: x.name, data: Movement.where(category: x.category).group_by_month(:date).sum(:ammount) }
    end
  end
 
  def new
    @movement = Movement.new
  end

  def create
    @movement = Movement.new(movement_params.merge(account: current_user.account))
    # @movement.account = current_user.account
    respond_to do |format|
      if @movement.save
        format.html { redirect_to movements_path, notice: "Movement was successfully created." }
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
