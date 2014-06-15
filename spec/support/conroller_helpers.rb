module ControllerHelpers
  def current_user
    user_session_info = response.request.env["rack.session"]["warden.user.user.key"]
    if user_session_info
      user.id = user_session_info[0][0]
      user.find(user.id)
    else
      nil
    end
  end

  def user_signed_in?
    !!current_user
  end
end