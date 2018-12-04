class BillsController < ApplicationController
  before_action :set_bill, only: [:show, :edit, :update, :destroy]

  # GET /bills
  def index
    @bills = Bill.all
  end

  # GET /bills/1
  def show
  end

  # GET /bills/new
  def new
    @bill = Bill.new
  end

  # GET /bills/1/edit
  def edit
  end

  # POST /bills
  def create
    @bill = Bill.new(bill_params)

    if @bill.save
      redirect_to @bill, notice: I18n.t('controllers.bills.successfully_created')
    else
      render :new
    end
  end

  # PATCH/PUT /bills/1
  def update
    if @bill.update(bill_params)
      redirect_to @bill, notice: I18n.t('controllers.bills.successfully_updated')
    else
      render :edit
    end
  end

  # DELETE /bills/1
  def destroy
    @bill.destroy
    redirect_to bills_url, notice: I18n.t('controllers.bills.successfully_destoyed')
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bill
      @bill = Bill.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def bill_params
      params.fetch(:bill, {})
    end
end
