class TasksController < ApplicationController

  def index
    if member_signed_in?
      @task = Task.new
      @tasks = Task.incoming.order(start_at: :asc)
    else
      redirect_to root_path
      flash[:notice] = "会員登録をおこなってください"
    end
  end

  def task_create
    @task = Task.new(task_params)
    @task.save
    redirect_to tasks_path
  end

  def update
    @task = Task.find(params[:id])
    @task.update_finished_true
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :content, :start_at, :finish_at, :kind, :finished).merge(member_id: current_member.id)
  end
end
