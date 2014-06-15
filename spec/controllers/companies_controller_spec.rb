require 'rails_helper'

RSpec.describe CompaniesController, :type => :controller do
  login_user
  let(:company) { Company.create!(name: 'kickin chicken') }

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
  
    it 'instantiates a new Company object' do
      expect(assigns(:company).new_record?).to be_true
      expect(assigns(:company).class).to eq Company
    end

    it { should be_success }
  end
  
end
