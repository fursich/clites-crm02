class CustomersController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  
  def index
    @q = Customer.search(params[:q])
    @customers = @q.result(distinct: true).page(params[:page])
  end

  def show
    @customer = Customer.find(params[:id])
    @comment = Comment.new
    # @comments = Comment.where(customer_id: params[:id].to_i)
    @customers = Comment.customers
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)

    if @customer.save
      redirect_to @customer
    else
      render :new
    end
  end

  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    
    redirect_to root_path
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])

    if @customer.update(customer_params)
      redirect_to @customer
    else
      render :edit
    end
  end

  private
  
  def customer_params
    params.require(:customer).permit(
    :family_name,
    :given_name,
    :email,
    :company_id,
    :post_id
    )
  end

end
