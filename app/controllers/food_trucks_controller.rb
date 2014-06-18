class FoodTrucksController < ApplicationController
  before_action :authenticate_user!
  before_filter :find_company, only: [:new, :create, :show, :edit, :update, :destroy, :closed, :serving, :likeorunlike]
  before_filter :find_food_truck, only: [:show, :edit, :update, :destroy, :closed, :serving, :likeorunlike]

  def index

    @food_trucks = FoodTruck.serving
    @geojson = Array.new

    @food_trucks.each do |food_truck|
      @geojson << {
        location: 
         [food_truck.longitude, food_truck.latitude], 
        properties: 
          [food_truck.name, food_truck.address] 
      }

    end
    respond_to do |format|
      format.html
      format.json { render json: @geojson }
    end
  end

  def new
    @food_truck = FoodTruck.new
  end

  def create
     @food_truck = @company.food_trucks.create food_truck_params
    success = @food_truck.save
    if success == true
      flash[:notice] = "You entered an acceptable Food Truck"
      redirect_to company_path(@company)  
    else
      flash[:error] = "Not an acceptable Food Truck"
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @food_truck.update_attributes food_truck_params
    redirect_to company_food_truck_path(@company, @food_truck)
  end

  def closed
    @food_truck.closed!
    respond_to do |format|
      format.js
    end
  end

  def serving
    @food_truck.serving!
    respond_to do |format|
      format.js
    end
  end

  def likeorunlike
      like_or_unlike = Like.all.where(user_id: current_user.id, food_truck_id: @food_truck)

    if like_or_unlike.length == 0
      @like = @food_truck.likes.create like_params
    elsif like_or_unlike.first.status == "unlike" 
      like_or_unlike.first.like!
    else
      like_or_unlike.first.unlike!
    end
    respond_to do |format|
      format.js
    end   
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

  def like_params
    params.require(:like).permit(:user_id, :food_truck_id, :status)
  end

  def food_truck_params
    params.require(:food_truck).permit(:name,
     :description,
      :image,
       :company_id,
       :address,
       :longitude,
       :latitude)
  end
end
