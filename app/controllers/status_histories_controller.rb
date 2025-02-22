class StatusHistoriesController < ApplicationController
  before_action :authenticate_user!

  def create
    @project = Project.find(params[:project_id])
    old_status = @project.status

    if @project.update(status_params)
      StatusHistory.create!(project: @project, user: current_user, old_status: old_status, new_status: @project.status)
      redirect_to @project, notice: 'Project status updated successfully.'
    else
      redirect_to @project, alert: 'Failed to update status.'
    end
  end

  private

  def status_params
    params.require(:project).permit(:status)
  end
end