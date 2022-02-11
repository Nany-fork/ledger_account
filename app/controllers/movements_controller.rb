class MovementsController < ApplicationController
  before_action :set_movement, only: %i[ show edit update destroy ]
  after_action :authenticate_user!
 
  def index
    account = current_user.account
    @movements = account.movements
    @account_balance = current_user.account.balance
  end

  def graphics
    #the account return the accumulated balance 
    @account = current_user.account
     
    #the movements of the currents user 
    @movements = current_user.account.movements
    
    #filtering manually the movement type that a i want to filter
    movement_type = MovementType.find_by(name:'Income')

    #return the movements of the incomes filter
    @income_movements = @movements.where(movement_type_id:movement_type.id)
    
    #return the movements of the incomes filter by the current month
    @total_of_month = @income_movements.where('extract(month from date) = ?', Date.today.strftime("%m")).sum(:ammount)

    #Return the number of catgories that has the movements of one user, category is a string defined by the type of movement
    @category = @movements.group(:category).count

    #Returns according to the types of movements [income, egress] is the case, your record in the month 
    @movements_graph = @movements.map do |movement|
        { name: movement.category, data: @movements.where(category: movement.category).group_by_week(:date).sum(:ammount) }
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
