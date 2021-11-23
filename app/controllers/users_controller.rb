class UsersController < ApplicationController
  

  
  def new
    @user = User.new
    
  end
  
  def index
    @users = User.all
    @user = current_user
    
    @book = Book.new
  end
  
  
  
  def create
    user = User.new(user_params)
    user.save
    redirect_to user_path(user.id)
  end
  
  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
    
  end
  
   def update
     @user = User.find(params[:id])
     if @user.update(user_params)
      flash[:notice] = "You have updated user successfully"
      redirect_to user_path(@user.id)
     else
      render "edit"
     end
     
  
    
   end
  
  def edit
   @user = User.find(params[:id])
   
  end
  
  def destroy
    @user = user.find(params[:id])
    @user.destroy
    redirect_to user_path
  end
  
  
   private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image) 
  end
end

