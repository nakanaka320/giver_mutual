class ApplicationController < ActionController::Base
# 今後実装するもの　current_memberメソッドでsession_id取得する
# before_action :authenticate_member!
before_action :configure_permitted_parameters, if: :devise_controller?
protect_from_forgery with: :exception

private

def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name, 
                                                     :email,
                                                     :password,
                                                     :password_confirmation,
                                                     :administrator,
                                                     :room_id])
end

end
