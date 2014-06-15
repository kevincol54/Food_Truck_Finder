require 'rails_helper'

RSpec.describe FoodTrucksController, :type => :controller do
  login_user
  let(:food_truck) { FoodTruck.create!(name: 'kickin chicken') }

  subject { response }

  it "should have a current_user" do
    subject.current_user.should_not be_nil
  end

  describe 'GET #index' do
    it 'does not break' do
      get :index
      expect(response).to be_success
    end
  end

  describe 'GET #new' do
    before do
      get :new
    end

    it 'instantiates a new food truck object' do
      expect(assigns(:food_truck).new_record?).to be_true
      expect(assigns(:food_truck).class).to eq FoodTruck
    end

    it { Should be_success }
  end
end
