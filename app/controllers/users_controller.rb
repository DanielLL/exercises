class UsersController < ApplicationController
  expose(:users)
  expose(:user, attributes: :user_attributes)

  def index
  end

  def new
  end

  def edit
  end

  def create
    user =  User.new(user_attributes)
    if user.valid?
      User.create!(user_attributes)
      flash[:notice] = "New user created."
      redirect_to users_path
    else
      flash[:notice] = "Your user was not created"
      redirect_to :back
    end

  end

  def update
    #This is ugly but I'm run out of time
    user = User.find(params[:id])
    if  user_attributes[:old_password] == user.password
      new_user = user_attributes
      user.update_attributes(name: new_user[:name], last_name: new_user[:last_name], mail: new_user[:mail], password: new_user[:password])
      flash[:notice] = "Your user was udpated"
      redirect_to users_path
    else
      flash[:notice] = "Your user was not udpated"
      redirect_to users_path
    end
  end

  private 

  def user_attributes
    params.require(:user).permit(
      :name,
      :last_name,
      :mail,
      :password,
      :old_password
    )
  end

end
