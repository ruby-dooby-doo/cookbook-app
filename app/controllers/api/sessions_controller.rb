class Api::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      p '*' * 50
      p user
      p 24.hours.from_now.to_i
      p '*' * 50
      jwt = JWT.encode(
        {
          user: user.id, # the data to encode
          exp: 24.hours.from_now.to_i # the expiration time
        },
        Rails.application.credentials.fetch(:secret_key_base), # the secret key
        'HS256' # the encryption algorithm
      )
      render json: {jwt: jwt, email: user.email}, status: :created
    else
      render json: {}
    end
  end
end
