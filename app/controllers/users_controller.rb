class UsersController < ApplicationController
  before_action :correct_user, only: [:edit, :update]

  def index
    @user = current_user
    @book = Book.new
    @users = User.all
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id

    if
      @book.save
      flash[:success] = "You have created book successfully."
      redirect_to
      book_path(@book)
    else
      @user = current_user
      @users = User.all
      render :index
    end

  end

  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books.page(params[:page]).reverse_order
  end


  def edit
      @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if
      @user.update(user_params)
      flash[:success] = "You have updated user successfully."
      redirect_to user_path(@user)
    else
      render :edit
    end

  end

  private

  def user_params
    params.require(:user).permit(:name, :image, :introduction)
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(user_path(current_user)) unless @user == current_user
  end

end
