class ProjectsController < ApplicationController
  
    before_action :logged_in_user, only: [:new, :create, :edit, :update, :destroy]


  def show
    @project = Project.find(params[:id])
    @authors = @project.authors
    @users  = User.find(@authors.ids)
    @research_partners = @project.research_partners.all
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
    @publications = Publication.all
    @users = User.all
    @authors = @project.authors
    @research_partners = ResearchPartner.all
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(project_params)
      redirect_to project_path(@project)
    else
      render 'edit'
    end
  end
 
  def destroy
    @project = Project.find(params[:id])
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
      params.require(:project).permit(:title, :description, :publication, :user_id, :image, :highlight, :research_partner )
    end
    
    

    
end
