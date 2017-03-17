class UsersController < ApplicationController
  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    @user.password = user_params[:password_digest]
    if @user.save
      session[:user_id] = @user[:id]
      session[:firstname] = @user[:firstname]
      respond_to do |format|
        format.json do
          render json: { id: @user.id, firstname: @user.firstname }, location: nil
        end
      end
    else
      respond_to { |format| format.json { render json: nil, location: nil } }
    end
  end

  def login
    @user = User.find_by(username: login_params[:username])
      .authenticate(login_params[:password_digest])
    if @user
      session[:user_id] = @user[:id]
      session[:firstname] = @user[:firstname]
      respond_with @user.to_json, location: nil
    else
      respond_with nil, location: nil
    end
  end

  def logout
    reset_session
    respond_to { |format| format.json { render json: nil, location: nil } }
  end

  def continue_game
    game = Game.where(continue_params).lastname
    if !game.nil?
      # Work some magic here
    else
      respond_to { |format| format.html { render json: nil, location: nil } }
    end
  end

  private

  # Never trust parameters from the scary internet,
  # only allow the white list through.
  def user_params
    params.require(:user)
      .permit(:firstname, :lastname, :username, :password_digest, :email)
  end

  def login_params
    params.require(:user).permit(:username, :password_digest)
  end

  def continue_params
    params.require(:user).permit(:user_id)
  end
end
