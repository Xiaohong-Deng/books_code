class ProjectsController < ApplicationController
  def index
  end

  def new
    @project = Project.new
  end

  def show
    @project = Project.find(params[:id])
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      flash[:notice] = "Project has been created."
      redirect_to @project
    else
      # render is not considered as another request
      # because it doesn't require you to go through
      # an action again
      flash.now[:alert] = "Project has not been created."
      render 'new'
    end
  end

  private
    def project_params
      params.require(:project).permit(:name, :description)
    end
end
