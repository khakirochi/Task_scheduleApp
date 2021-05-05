class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end
  
  def new
    @task = Task.new
  end
  
  def create
    @task = Task.new(params.require(:task).permit(:title, :start_date, :end_date, :is_all_day, :memo))
    if @task.save
      flash[:notice] = "スケジュールを新規登録しました"
      redirect_to tasks_path
    else
      flash.now[:alert] = "スケジュールを新規登録できませんでした"
      render "new"
    end
  end
  
  def show
    @task = Task.find(params[:id])
  end
  
  def edit
    @task = Task.find(params[:id])
  end
  
  def update
    @task = Task.find(params[:id])
    if @task.update(params.require(:task).permit(:title, :start_date, :end_date, :is_all_day, :memo))
      flash[:notice] = "スケジュールを更新しました"
      redirect_to tasks_path
    else
      flash.now[:alert] = "スケジュールを更新できませんでした"
      render "edit"
    end
  end
  
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:destroy] = "スケジュールを削除しました"
    redirect_to tasks_path
  end
end
