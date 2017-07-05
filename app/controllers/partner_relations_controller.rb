class PartnerRelationsController < ApplicationController
    before_action :logged_in_user, only: [:new, :create, :edit, :update, :destroy]

  def create
  
    @research_partner = ResearchPartner.find(params[:research_partner_id])
    @project = Project.find(params[:project_id])
    @project.partner(@research_partner)
    @research_partners = ResearchPartner.all
    respond_to do |format|
      format.html { redirect_to @project_show_url }
      format.js
    end
  end

  def destroy
    @research_partner = ResearchPartner.find(params[:research_partner_id])
    @project = Project.find(params[:project_id])
    @project.breakup(@research_partner)
    @research_partners = ResearchPartner.all
    respond_to do |format|
      format.html { redirect_to @project }
      format.js
    end
  end
end
