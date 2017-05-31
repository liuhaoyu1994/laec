class ProjectsController < ApplicationController
  def show
    @project = Project.find(params[:id])
    @authors = @project.authors
    @users  = User.find(@authors.ids)
  end

  def new
    @project = Project.new
    @users = User.all
  end

  def create
    @project = Project.new(project_params)
    @project.user_id = current_user.id
    if @project.save
      redirect_to edit_project_path(@project)
    else
      render 'new'
    end
    
  end
 
 def index
   @projects = Project.all
 end
 
  def edit
    @users = User.all
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(project_params)
    else
      render 'edit'
    end
  end
 
  def participate

  end
 
  private

    def project_params
      params.require(:project).permit(:title, :description, :publication, :user_id, :image,
                                   :password_confirmation)
    end
    
    

    
end
