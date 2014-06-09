class FoodTrucksController < ApplicationController
  before_filter :find_company, only: [:new, :create, :show, :edit, :update, :destroy]
  before_filter :find_food_truck, only: [:show, :edit, :update, :destroy]

  def index
    @food_truck = FoodTruck.all
  end

  def new
    @food_truck = FoodTruck.new
  end

  def create
     @food_truck = @company.food_trucks.create food_truck_params
    success = @food_truck.save
    if success == true
      flash[:notice] = "You entered an acceptable Food Truck"
      redirect_to companies_path
    else
      flash[:error] = "Not an acceptable Food Truck"
      render :new
    end
  end

  def show
    @food_truck = @company.food_trucks
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def find_food_truck
    @food_truck = FoodTruck.find params[:id]
  end

  def find_company
    @company = Company.find params[:company_id]
  end

  def food_truck_params
    params.require(:food_truck).permit(:name, :description, :image, :company_id)
  end
end
