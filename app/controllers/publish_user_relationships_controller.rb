class PublishUserRelationshipsController < ApplicationController
    def create
    @user = User.find(params[:user_id])
    @publication = Publication.find(params[:publication_id])
    @publication.add(@user)
    @users = User.all
    respond_to do |format|
      format.html { redirect_to @publication_show_url }
      format.js
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @publication = Publication.find(params[:publication_id])
    @publication.quit(@user)
    @users = User.all
    respond_to do |format|
      format.html { redirect_to @publication }
      format.js
    end
  end
end
