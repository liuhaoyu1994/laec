class GalleriesController < ApplicationController
  def show
  end

  def new
  end

  def index
  end

  def create
    @project = Project.find(params[:project_id])
    @gallery = @project.galleries.build(gallery_params)
    if @gallery.save
      redirect_to project_path(@project)
    end
  end

  def edit
  end
  
  def update
        redirect_to(projects_path)
  end
  
  private

    def gallery_params
      params.require(:gallery).permit(:description, :project_id, :image )
    end
end
