class PomodorosController < ApplicationController
  before_action :set_task

  def index
    @pomodoros = @task.pomodoros
  end

  def new
    @pomodoro = @task.pomodoros.build
  end

  def create
    @pomodoro = @task.pomodoros.build(pomodoro_params)
    if @pomodoro.save
      redirect_to task_pomodoros_path(@task), notice: "Pomodoro criado com sucesso!"
    else
      render :new
    end
  end

  private

  def set_task
    @task = Task.find(params[:task_id])
  end

  def pomodoro_params
    params.require(:pomodoro).permit(:duracao)
  end
end
