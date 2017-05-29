class AuthorsController < ApplicationController
  def show
    @author = Author.find(params[:id])
  end


  def new
    @author = Author.new
    @user = User.find(params[:id])
    @project = Project.find(params[:id])
  end

  def create
    @author = Author.new(author_params)
    if @author.save
      redirect_to @author
    else
      render 'new'
    end
    
  end
 
 def index
   @authors = Author.all
 end
 
  private
end
