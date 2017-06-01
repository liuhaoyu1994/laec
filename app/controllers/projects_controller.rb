class ProjectsController < ApplicationController
  
    before_action :correct_user,   only: :destroy

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
    @project = Project.find(params[:id])
    @users = User.all
    @authors = @project.authors
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(project_params)
    else
      render 'edit'
    end
  end
 
  def destroy
    @project.destroy
    flash[:success] = "project deleted"
    redirect_to(projects_path)
  end

  def correct_user
    @project = current_user.projects.find_by(id: params[:id])
    redirect_to root_url if @project.nil?
  end
    
  private

    def project_params
      params.require(:project).permit(:title, :description, :publication, :user_id, :image,
                                   :password_confirmation)
    end
    
    

    
end
