class TasksController < ApplicationController

  def index
    if member_signed_in?
      @task = Task.new
      @tasks = Task.find(current_member.tasks.ids)
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
    params.require(:task).permit(
      :title,
      :content, 
      :start_at, 
      :finish_at, 
      :kind, 
      :finished, 
      :time_required).merge(member_id: current_member.id, room_id: current_member.room.id)
  end
end