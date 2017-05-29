class ProjectsController < ApplicationController
  def show
    @project = Project.find(params[:id])
  end


  def new
    @project = Project.new
    @users = User.all
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      @author = Author.new(author_params)
      debugger
      redirect_to @project
    else
      render 'new'
    end
    
  end
 
 def index
   @projects = Project.all
 end
 
  private

    def project_params
      params.require(:project).permit(:title, :description, :publication, :user_id, :image,
                                   :password_confirmation)
    end
    

    
    def author_params
      params.require(:author).permit(:user_id, :project_id)
    end
end
