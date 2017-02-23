class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    respond_to { |format| format.html { render json: nil, location: nil, status: 404 } }
  end

  # GET /users/1
  # GET /users/1.json
  def show
    respond_to { |format| format.html { render json: nil, location: nil, status: 404 } }
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit; end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    @user.password = user_params[:password_digest]
    if @user.save
      session[:user_id] = @user[:id]
      session[:firstname] = @user[:firstname]
      respond_to { |format| format.html { render json: @user.id, location: nil } }
    else
      respond_to { |format| format.html { render json: nil, location: nil } }
    end
  end

  def login
    @user = User.find_by(username: login_params[:username]).authenticate(login_params[:password_digest])
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

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:firstname, :lastname, :username, :password_digest, :email)
  end

  def login_params
    params.require(:user).permit(:username, :password_digest)
  end

  def continue_params
    params.require(:user).permit(:user_id)
  end
end
