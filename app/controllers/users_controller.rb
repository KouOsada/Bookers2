class UsersController < ApplicationController

  def index
    @book = Book.new
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end



end
