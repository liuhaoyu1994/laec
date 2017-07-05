class PublishRelationshipsController < ApplicationController
    before_action :logged_in_user, only: [:new, :create, :edit, :update, :destroy]

  def create
    @project = Project.find(params[:project_id])
    @publications = Publication.all
    @publication = Publication.find(params[:publication_id])
    @publication.relate(@project)
    respond_to do |format|
      format.html { redirect_to @project_show_url }
      format.js
    end
  end

  def destroy
    @project = Project.find(params[:project_id])
    @publication = Publication.find(params[:publication_id])
    @publications = Publication.all
    @publication.disrelate(@project)
    @projects = Project.all
    respond_to do |format|
      format.html { redirect_to @project }
      format.js
    end
  end
end
