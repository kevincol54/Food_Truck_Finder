require 'rails_helper'

RSpec.describe CompaniesController, :type => :controller do
  
  let(:company) { Company.create!(name: 'kickin chicken') }
  login_user

  subject { response }
  # before(:each) do
  #   subject.current_user = "fucking awesome"
  # end
  it "should have a current_user" do
    subject.current_user.should_not be_nil
  end

  # it 'should get index' do
  #   get 'index'
  #   response.should be_success
  # end

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
  
    it 'instantiates a new Company object' do
      expect(assigns(:company).new_record?).to be_true
      expect(assigns(:company).class).to eq Company
    end

    it { should be_success }
  end
  
end
