class CompaniesController < ApplicationController
  before_action :authenticate_user!
  before_filter :find_company, only: [:show, :update, :edit, :destroy]

  def index
    @company = Company.all.accessible_by(current_ability, :read)
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.create company_params.merge(user_id: current_user.id)
    success = @company.save
    if success == true
      flash[:notice] = "You entered an acceptable Company"
      redirect_to companies_path
    else
      flash[:error] = "Not an acceptable Company"
      render :new
    end
  end

  def show
    @food_truck = @company.food_trucks
  end

  def edit
  end

  def update
    @company.update_attributes company_params
    redirect_to company_path(@company)
  end

  def destroy
  end

  private
  def find_company
    @company = Company.find params[:id]
  end

  def company_params
    params.require(:company).permit(:name, :description, :image)
  end
end
