class ApplicationController < ActionController::Base
end

def after_sign_in_path_for(resource)
  users_path
end