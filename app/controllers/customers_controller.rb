class CustomersController < ApplicationController
  def index
    @customer = Customer.new
    @customers = Customer.where(status: "false").all.order(created_at: :desc)
  end

  def create
    @customer = Customer.new(customers_params)
    if @customer.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customers_params)
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def ban
    @customer = Customer.find(params[:id])
    if(@customer)
      @customer.status = "true";
      redirect_to root_path if @customer.save
    else
      redirect_to root_path
    end
  end

  def unban
    @customer = Customer.find(params[:id])
    if(@customer)
      @customer.status = "false";
      redirect_to root_path if @customer.save
    else
      redirect_to root_path
    end
  end

  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    redirect_to root_path
  end

  def black_list
    @customers = Customer.where(status: "true").all.order(created_at: :desc)
  end

  def add_to_black_list
    @customers = Customer.where(phone: params[:phone]).all
    @customers.each do |customer|
      customer.status = "true";
      customer.save
    end
    redirect_to '/black_list'
  end

  private
  def customers_params
    params.require(:customer).permit(:name, :phone, :desc, :status)
  end
end