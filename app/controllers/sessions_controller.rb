class SessionsController < ApplicationController
  protect_from_forgery with: :null_session

  def new
    render :new 
  end

  def create
    # binding.pry
    user_info = request.env['omniauth.auth']
    # raise user_info # Your own session management should be placed here
    puts "user_info: #{user_info}"
  end
end