class ProjectsController < ApplicationController
  before_action :authenticate_user!

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find_by(id: params[:id])
    return redirect_to projects_path, alert: 'Project not found' unless @project

    @comments_history = @project.comments.includes(:user).order(created_at: :desc)
    @status_history = @project.status_histories.includes(:user).order(created_at: :desc)
  end
end