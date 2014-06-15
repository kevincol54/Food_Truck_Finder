module ControllerMacros  
  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = FactoryGirl.create(:user)
      sign_in user
    end
  end

  def sign_in(user = double('user'))
    if user.nil?
      request.env['warden'].stub(:authenticate!).
        and_throw(:warden, {:scope => :user})
      allow(controller).to receive(:current_user) { nil }
    else
      request.env['warden'].stub :authenticate! => user
      allow(controller).to receive(:current_user) { user }
    end
  end

end