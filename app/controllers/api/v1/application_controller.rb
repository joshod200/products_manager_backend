module Api::V1

  class ApplicationController < ActionController::API
    include DeviseTokenAuth::Concerns::SetUserByToken
  end

end
