class Api::V1::TasksController < Api::V1::ApiController

  before_action :authenticate_api!

  def index
  	@tasks = @user.tasks
  end

  def create
  	@task = Task.new(task_params)
  	@task.user_id = @user.id
    @task.save
  end

  
  private

  def task_params
  	params[:task].permit(:title, :is_completed)
  end
  
end
