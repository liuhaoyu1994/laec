class RelationshipsController < ApplicationController
  
  def create
    @author = User.find(params[:author_id])
    @article = Project.find(params[:article_id])
    @article.participate(@author)
    @project = @article
    @users = User.all
    @authors = @project.authors
    respond_to do |format|
      format.html { redirect_to @article_show_url }
      format.js
    end
  end

  def destroy
    @author = User.find(params[:author_id])
    @article = Project.find(params[:article_id])
    @article.quit(@author)
    @project = @article
    @users = User.all
    @authors = @project.authors
    respond_to do |format|
      format.html { redirect_to @article }
      format.js
    end
  end
  
end
